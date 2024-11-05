return {
  "tpope/vim-fugitive",
  config = function()
    local keymap = vim.keymap

    -- Git add the current file
    keymap.set('n', '<leader>ga', ':Git add %:p<CR><CR>', { silent = true })
    -- Git commit with verbose and quiet flags
    keymap.set('n', '<leader>gc', ':Git commit -v -q<CR>', { silent = true })
    -- Git diff
    keymap.set('n', '<leader>gd', ':Gdiff<CR>', { silent = true })
    -- Git move (rename)
    keymap.set('n', '<leader>gm', ':Gmove ', {})
    -- Git blame
    keymap.set('n', '<leader>gb', ':Git blame<CR>', { silent = true })
    -- Git checkout
    keymap.set('n', '<leader>go', ':Git checkout ', {})
    -- Git status
    keymap.set('n', '<leader>gs', ':G<CR>', { silent = true })
    -- Git diffget for right side (theirs)
    keymap.set('n', '<leader>gj', ':diffget //3<CR>', { silent = true })
    -- Git diffget for left side (ours)
    keymap.set('n', '<leader>gf', ':diffget //2<CR>', { silent = true })
  end,
}
