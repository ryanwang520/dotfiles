return {

  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {

      -- theme = 'nightfly',
      theme = 'tokyonight',
      icons_enabled = true,
      component_separators = '|',
      section_separators = '',
      sections = {
        lualine_a = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
      },
    }
  end,
}
