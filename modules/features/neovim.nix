{
  flake.nixosModules.neovim = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    nix.settings.nix-path = ["nixpkgs=flake:nixpkgs"];
  };

  flake.homeModules.neovim = {pkgs, ...}: {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      initLua = builtins.readFile ./_conf/neovim/options.lua;

      plugins = with pkgs.vimPlugins; [
        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = builtins.readFile ./_conf/neovim/plugin/lsp.lua;
        }
        {
          plugin = comment-nvim;
          type = "lua";
          config = ''require("Comment").setup()'';
        }
        {
          plugin = dracula-nvim;
          type = "lua";
          config = ''vim.cmd.colorscheme("dracula")'';
        }
        lazydev-nvim
        {
          plugin = nvim-cmp;
          type = "lua";
          config = builtins.readFile ./_conf/neovim/plugin/cmp.lua;
        }
        plenary-nvim
        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./_conf/neovim/plugin/telescope.lua;
        }
        telescope-fzf-native-nvim
        cmp_luasnip
        cmp-nvim-lsp
        luasnip
        friendly-snippets
        {
          plugin = lualine-nvim;
          type = "lua";
          config = ''require("lualine").setup()'';
        }
        nvim-web-devicons
        {
          plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
          type = "lua";
          config = builtins.readFile ./_conf/neovim/plugin/treesitter.lua;
        }
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
