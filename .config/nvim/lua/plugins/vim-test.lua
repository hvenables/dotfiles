return {
  "vim-test/vim-test",
  dependencies = {
    "jgdavey/tslime.vim"
  },
  cond = function()
    return vim.env.TMUX ~= nil
  end,
  config = function()
    vim.g["test#strategy"] = "tslime"

    local keymap = vim.keymap

    keymap.set('n', '<Leader>tf', ':TestFile<CR>', { noremap = true, silent = true })
    keymap.set('n', '<Leader>tn', ':TestNearest<CR>', { noremap = true, silent = true })
    keymap.set('n', '<Leader>tl', ':TestLast<CR>', { noremap = true, silent = true })
    keymap.set('n', '<Leader>ts', ':TestSuite<CR>', { noremap = true, silent = true })
  end,
}
