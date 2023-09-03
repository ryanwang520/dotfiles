return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- OR setup with some options
    require('nvim-tree').setup {
      sort_by = 'case_sensitive',
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    }

    -- Auto open Nvim Tree when nvim is started without arguments
    -- vim.cmd([[
    --   autocmd VimEnter * if argc() == 0 | NvimTreeToggle | endif
    -- ]])
  end,
}
