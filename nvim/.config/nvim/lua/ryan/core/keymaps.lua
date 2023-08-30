vim.g.mapleader = ","

local keymap = vim.keymap



keymap.set('i', 'jk', '<esc>')

keymap.set("n", "<leader>l", ":nohl<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
