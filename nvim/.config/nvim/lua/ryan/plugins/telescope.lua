return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
  config = function()
    local actions_setup, actions = pcall(require, 'telescope.actions')
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
          },
        },
      },
      pickers = {},
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'ui-select'
  end,
}
