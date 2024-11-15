-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "BufReadPost", "FocusGained", "VimResume" }, {
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({"VimResized"}, {
  pattern = "*",
  command = "wincmd =",
})
