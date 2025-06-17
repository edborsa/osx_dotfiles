return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove" },
  keys = {
    { "<leader>gs", "<cmd>G<cr>", desc = "Git status (fugitive)" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
  },
  config = function()
    vim.g.fugitive_no_maps = 1
  end,
} 