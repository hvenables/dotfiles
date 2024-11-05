local keymap = vim.keymap

keymap.set("n", "<leader>nt", ":tabnew<CR>", { silent = true, desc = "Open a new tab" })

keymap.set('i', 'jj', '<esc>:w<CR>', { desc = "Exit insert mode and save" })

-- search next/previous -- center in page
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.api.nvim_create_user_command("Q", "q", {})  -- Bind :Q to :q
vim.api.nvim_create_user_command("E", "e", {})  -- Bind :E to :e

vim.keymap.set('n', '<leader>rm', function()
  local file = vim.fn.expand('%:p')
  vim.fn.delete(file)
  vim.cmd('bd!')
end, { desc = "Delete current file and close buffer" })
