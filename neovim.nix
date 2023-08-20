{ config, pkgs, ... }:
{
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
    ];
  };
}
