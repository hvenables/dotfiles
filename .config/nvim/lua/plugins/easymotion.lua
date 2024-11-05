return {
  {
    "easymotion/vim-easymotion",
    event = "VeryLazy",  -- Load only when needed (on key press)
    config = function()
      local keymap = vim.keymap

      keymap.set('n', '<Leader>f', '<Plug>(easymotion-bd-f)')
      keymap.set('n', '<Leader>f', '<Plug>(easymotion-overwin-f)')

      -- s{char}{char} to move to {char}{char}
      keymap.set('n', 's', '<Plug>(easymotion-overwin-f2)')

      -- Move to line
      keymap.set('', '<Leader>L', '<Plug>(easymotion-bd-jk)')
      keymap.set('n', '<Leader>L', '<Plug>(easymotion-overwin-line)')

      -- Move to word
      keymap.set('', '<Leader>w', '<Plug>(easymotion-bd-w)')
      keymap.set('n', '<Leader>w', '<Plug>(easymotion-overwin-w)')
    end,
  }
}
