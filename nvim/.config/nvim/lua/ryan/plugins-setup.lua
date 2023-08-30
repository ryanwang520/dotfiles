
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
        "nvim-tree/nvim-tree.lua",
        "nvim-tree/nvim-web-devicons",
        { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
        {'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { 'nvim-lua/plenary.nvim'}},
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
        "nvim-lua/plenary.nvim",
        'nvim-lualine/lualine.nvim',
        'tpope/vim-fugitive',
        'tpope/vim-surround',
        'lukas-reineke/indent-blankline.nvim',
        {'numToStr/Comment.nvim', lazy = false},
        'christoomey/vim-tmux-navigator'
})
