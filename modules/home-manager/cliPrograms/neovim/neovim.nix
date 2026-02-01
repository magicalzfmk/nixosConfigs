{
  pkgs,
  inputs,
  ...
}: let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in {
  nixpkgs = {
    overlays = [
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
  };

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    initLua = ''
      ${builtins.readFile ./nvim/options.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./nvim/plugin/lsp.lua;
      }
      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }
      {
        plugin = dracula-nvim;
        config = "colorscheme dracula";
      }
      lazydev-nvim
      {
        plugin = nvim-cmp;
        config = toLuaFile ./nvim/plugin/cmp.lua;
      }
      plenary-nvim
      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/plugin/telescope.lua;
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
        # config = toLuaFile ./nvim/plugin/treesitter.lua;
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
}
