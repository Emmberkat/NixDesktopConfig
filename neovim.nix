{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nodePackages.pyright
    gopls
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      set shiftwidth=4 smarttab
      set expandtab
      set tabstop=4 softtabstop=0
      set number relativenumber
    '';
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-treesitter;
        type = "lua";
        config = ''
          require'nvim-treesitter.configs'.setup {
            highlight = {
              enable = true,
            },
            additional_vim_regex_highlighting = false,
          }
        '';
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          local builtin = require('telescope.builtin')
          vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        '';
      }
      nvim-lspconfig
      {
        plugin = lsp-zero-nvim;
        type = "lua";
        config = ''
          local lsp = require('lsp-zero').preset({})
  
          lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({buffer = bufnr})
          end)
  
          lsp.setup_servers({'gopls', 'pyright'})
  
          lsp.setup()
        '';
      }
      nvim-treesitter-parsers.c
      nvim-treesitter-parsers.go
      nvim-treesitter-parsers.gitcommit
      nvim-treesitter-parsers.gitignore
      nvim-treesitter-parsers.git_rebase
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.query
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.vim
      nvim-treesitter-parsers.vimdoc
      nvim-treesitter-context
      cmp-nvim-lsp
      vim-vsnip
      cmp-vsnip
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          local cmp = require'cmp'
          cmp.setup({
            snippet = {
              expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'vsnip' },
            }, {
              { name = 'buffer' },
            }),
          })
        '';
      }
    ];
  };
}
