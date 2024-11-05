return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
      -- Load spectre
      local spectre = require('spectre')

      -- Ignore .rbi files globally
      spectre.setup({
        is_open_target_win = true,
        find_engine = {
          rg = {
            cmd = "rg",
            -- Customize the arguments passed to ripgrep (rg)
            args = {
              "--vimgrep",
              "--hidden",
              "--glob", "!*.rbi", -- Ignore .rbi files
            },
          },
        },
      })

      local keymap = vim.keymap -- for conciseness

      -- Key mappings using the local spectre variable
      keymap.set('n', '<leader>S', function() spectre.open() end, { desc = "Open Spectre" })
      keymap.set('n', '<leader>sw', function() spectre.open_visual({ select_word = true }) end, { desc = "Search current word" })
      keymap.set('v', '<leader>s', function() spectre.open_visual() end, { desc = "Search selection" })
      keymap.set('n', '<leader>sp', function() spectre.open_file_search() end, { desc = "Search in current file" })
    end,
  },
}
