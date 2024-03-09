return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      -- ensure_installed = {
      --   'c',
      --   'cpp',
      --   'go',
      --   'lua',
      --   'python',
      --   'rust',
      --   'tsx',
      --   'javascript',
      --   'typescript',
      --   'vimdoc',
      --   'vim',
      --   'astro',
      --   'css',
      --   'terraform',
      --   'html',
      --   'scss',
      -- },

      auto_install = true,

      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
    }
  end,
}
