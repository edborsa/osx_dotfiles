local map = vim.api.nvim_set_keymap


-- get out of terminal mode
map("t", "jk", "<C-\\><C-n>", {noremap = true, silent = false})
