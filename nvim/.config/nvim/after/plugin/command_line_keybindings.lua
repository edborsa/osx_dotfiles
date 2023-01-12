local map = vim.api.nvim_set_keymap

-- move cursor within command line mode
map("c", "<C-h>", "<Left>", {noremap = true, silent = false})
map("c", "<C-e>", "<End>", {noremap = true, silent = false})
map("c", "<C-l>", "<Right>", {noremap = true, silent = false})
map("c", "<C-j>", "<Down>", {noremap = true, silent = false})
map("c", "<C-k>", "<Up>", {noremap = true, silent = false})
map("c", "<C-a>", "<ESC>^i", {noremap = true, silent = false})
