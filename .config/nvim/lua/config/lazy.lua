-- Bootstrap Lazy.nvim if it's not installed
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazy_path
    })
end
vim.opt.rtp:prepend(lazy_path)

-- Lazy.nvim plugin setup
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.lsp" },
  },
  install = { colorscheme = { "nightfly" } },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
