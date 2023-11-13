local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.swapfile = false

opt.splitright = true
opt.splitbelow = true

-- not break word on -
vim.opt.iskeyword:append '-'

vim.o.mouse = ''


-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

opt.tabstop = 4

--- This controls the time (in milliseconds) that NeoVim waits for a mapped key sequence to complete.
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- curor blink
vim.o.guicursor = 'n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.wo.foldmethod = "indent"
    vim.wo.foldlevel = 99
  end,
})
