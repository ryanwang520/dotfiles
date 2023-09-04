local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
  require 'ryan.plugins.nvim-tree',
  'nvim-tree/nvim-web-devicons',
  require 'ryan.plugins.vim-nightfly-colors',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  require 'ryan.plugins.telescope',
  require 'ryan.plugins.nvim-treesitter',
  'nvim-lua/plenary.nvim',
  require 'ryan.plugins.lualine',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  require 'ryan.plugins.indent_blankline',
  require 'ryan.plugins.comment',
  'christoomey/vim-tmux-navigator',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  require 'ryan.plugins.lspconfig',
  require 'ryan.plugins.nvim-cmp',
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',                     opts = {} },
  require 'ryan.plugins.gitsigns',
  'github/copilot.vim',
  'stevearc/dressing.nvim',
  'simrat39/rust-tools.nvim',
  'mfussenegger/nvim-dap',
}
