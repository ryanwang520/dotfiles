-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
        "navarasu/onedark.nvim",
        {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
          dependencies = { 'nvim-lua/plenary.nvim' },
          {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
          "nvim-lua/plenary.nvim",
            'nvim-lualine/lualine.nvim'


  }
})



-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('onedark').setup {
    style = 'cool'
}

require('onedark').load()


require('lualine').setup {
  options = {
              theme = 'onedark'

  }
}


vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', {noremap = true, silent = true})



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
