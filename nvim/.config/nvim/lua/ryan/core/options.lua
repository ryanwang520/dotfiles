local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.swapfile = false
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = 'indent,eol,start'


opt.clipboard:append("unnamedplus")

vim.opt.iskeyword:append("-")

vim.o.mouse = 'a'
