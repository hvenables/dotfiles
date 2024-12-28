return {
  "tpope/vim-rails",
  config = function()
    local keymap = vim.keymap

    keymap.set('n', '<Leader>av', ':AV<CR>', { noremap = true, silent = true })
    keymap.set('n', '<Leader>rv', ':RV<CR>', { noremap = true, silent = true })
  end,
}
