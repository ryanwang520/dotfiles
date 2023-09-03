return {

  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {

      theme = 'nightfly',
      icons_enabled = true,
      component_separators = '|',
      section_separators = '',
    }
  end,
}
