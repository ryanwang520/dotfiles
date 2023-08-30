
require('ryan.plugins-setup')
require('ryan.core.options')
require('ryan.core.keymaps')
require('ryan.core.colorscheme')

require('ryan.plugins.nvim-tree')
require('ryan.plugins.comment')

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}


-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


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
    dotfiles = false,
  },
})


require('lualine').setup {

        theme = "nightfly"
}

vim.o.mouse = 'a'




local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})


-- Auto open Nvim Tree when nvim is started without arguments
vim.cmd [[
  autocmd VimEnter * if argc() == 0 | NvimTreeToggle | endif
]]



require'nvim-treesitter.configs'.setup {
  ensure_installed = {"typescript", "tsx", "javascript", "python", "rust", "go"},
  highlight = {
    enable = true,                           
    additional_vim_regex_highlighting = false,
  },
  filetype_specific = {                     
    tsx = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
}
