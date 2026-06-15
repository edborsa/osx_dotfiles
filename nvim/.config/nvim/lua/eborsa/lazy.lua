local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local ok, lazy = pcall(require, "lazy")

if not ok and not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

if not ok then
  vim.opt.rtp:prepend(lazypath)
  ok, lazy = pcall(require, "lazy")
end

if not ok then
  error("lazy.nvim is unavailable; install it with Nix or check the bootstrap clone")
end

lazy.setup({ { import = "eborsa.plugins" }, { import = "eborsa.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
