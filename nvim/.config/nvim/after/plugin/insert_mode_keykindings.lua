local map = vim.api.nvim_set_keymap
map('i', 'jk', '<ESC>', {noremap = true, silent = false})
map('i', 'kj', '<ESC>', {noremap = true, silent = false})

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
