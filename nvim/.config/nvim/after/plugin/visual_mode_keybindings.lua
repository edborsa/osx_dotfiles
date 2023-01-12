--[[ mapmode-x: activated only in visual mode ]]
--[[ mapmode-s: activated only in select mode ]]
--[[ mapmode-v: activated in both visual and select mode-  ]]

local map = vim.api.nvim_set_keymap

map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

-- Don't copy the replaced text after pasting in visual mode
map("v", "p", "p:let @+=@0<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("v", "<leader>re",
                        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
                        {noremap = true, silent = true, expr = false})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- What does it do?
vim.keymap.set("x", "<leader>p", [["_dP]])
