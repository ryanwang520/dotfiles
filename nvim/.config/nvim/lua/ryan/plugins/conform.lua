return {

  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        markdown = { 'prettier' },
        json = { 'prettier' },
        rust = { 'rustfmt' },
        go = { 'gofmt' },
        astro = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        less = { 'prettier' },
        terraform = { 'terraform_fmt' },
        -- Conform will run multiple formatters sequentially
        python = { 'ruff_fix', 'ruff_format' },

        -- Use a sub-list to run only the first available formatter
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
      },
    }
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function(args)
        require('conform').format { bufnr = args.buf }
      end,
    })
  end,
}
