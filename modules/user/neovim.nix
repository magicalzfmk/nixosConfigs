# Neovim closure: system-wide default editor (NixOS) and full plugin configuration
# with LSP, completion, Telescope, Treesitter, and the Dracula theme (Home-Manager).
# The dracula.nvim plugin is sourced from the flake input plugin-dracula.
{config, ...}: {
  # NixOS side: make neovim the system default editor
  flake.modules.nixos.neovim = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    # Fix nix-path so nixd LSP can resolve <nixpkgs>
    nix.settings.nix-path = ["nixpkgs=flake:nixpkgs"];
  };

  # Home-Manager side: full neovim configuration
  flake.modules.homeManager.neovim = {
    pkgs,
    inputs,
    ...
  }: let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    nixpkgs.overlays = [
      (final: prev: {
        vimPlugins =
          prev.vimPlugins
          // {
            own-dracula-nvim = prev.vimUtils.buildVimPlugin {
              name = "dracula";
              src = inputs.plugin-dracula;
            };
          };
      })
    ];

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      initLua = builtins.readFile ./_neovim/options.lua;

      plugins = with pkgs.vimPlugins; [
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./_neovim/plugin/lsp.lua;
        }
        {
          plugin = comment-nvim;
          config = toLua ''require("Comment").setup()'';
        }
        {
          plugin = dracula-nvim;
          config = "colorscheme dracula";
        }
        lazydev-nvim
        {
          plugin = nvim-cmp;
          config = toLuaFile ./_neovim/plugin/cmp.lua;
        }
        plenary-nvim
        {
          plugin = telescope-nvim;
          config = toLuaFile ./_neovim/plugin/telescope.lua;
        }
        telescope-fzf-native-nvim
        cmp_luasnip
        cmp-nvim-lsp
        luasnip
        friendly-snippets
        lualine-nvim
        nvim-web-devicons
        {
          plugin = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
          ]);
        }
        vim-nix
      ];

      extraPackages = with pkgs; [
        lua-language-server
        nixd
        alejandra
        xclip
        wl-clipboard
      ];
    };
  };
}
