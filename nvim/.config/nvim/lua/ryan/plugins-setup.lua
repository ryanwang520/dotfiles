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
  'nvim-tree/nvim-web-devicons',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'windwp/nvim-ts-autotag',
  'nvim-lua/plenary.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  'christoomey/vim-tmux-navigator',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'github/copilot.vim',
  'stevearc/dressing.nvim',
  'simrat39/rust-tools.nvim',
  'mfussenegger/nvim-dap',
  require 'ryan.plugins.vim-nightfly-colors',
  require 'ryan.plugins.nvim-tree',
  require 'ryan.plugins.telescope',
  require 'ryan.plugins.nvim-treesitter',
  require 'ryan.plugins.lualine',
  require 'ryan.plugins.which-key',
  require 'ryan.plugins.indent_blankline',
  require 'ryan.plugins.comment',
  require 'ryan.plugins.lspconfig',
  require 'ryan.plugins.nvim-cmp',
  require 'ryan.plugins.gitsigns',
}
