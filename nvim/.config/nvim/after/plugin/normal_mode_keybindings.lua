local map = vim.api.nvim_set_keymap

map('n', 'Y', 'Vy', { noremap = true, silent = false })
map('n', '<leader>,', ':nohlsearch<cr>', { noremap = true, silent = false })

-- use ESC to turn off search highlighting
map("n", "<Esc>", "<cmd> :noh <CR>", { noremap = true, silent = false })

map("n", "L", "<cmd> :bn<CR>", { noremap = true, silent = true })
map("n", "H", "<cmd> :bp<CR>", { noremap = true, silent = true })

-- navigation between windows
--[[ map('n', '<C-h>', '<C-w>h', { noremap = true, silent = false }) ]]
--[[ map('n', '<C-l>', '<C-w>l', { noremap = true, silent = false }) ]]
--[[ map('n', '<C-j>', '<C-w>j', { noremap = true, silent = false }) ]]
--[[ map('n', '<C-k>', '<C-w>k', { noremap = true, silent = false }) ]]

--[[ map("n", "<S-t>", "<cmd> :enew <CR>", {noremap = true, silent = false}) -- new buffer ]]

-- LSP in normal mode
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap = true, silent = false })
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = false })
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = false })
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = false })


-- FOOOOO
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Maintain in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- This might not work because of my set on yank buffers
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- deletion over visual mode does not put to the yank buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- ??
vim.keymap.set("n", "Q", "<nop>")

-- Call Tmux sessionzier - check the bin file of this dotfiles
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- This might work if I Know how to use the quick fix list
--[[ vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") ]]
--[[ vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz") ]]
--[[ vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") ]]
--[[ vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") ]]

-- Not Sure.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Not Sure.
vim.keymap.set("n", "<leader>s",
               [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})
