return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "junegunn/fzf", build = "./install --bin" }
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      "telescope",
      files = {
          -- Add the ignore pattern here
        cmd = "rg --files --hidden --glob '!*.rbi' --glob '!*.beam' --glob '!.git/**'",
      },
    })

    local keymap = vim.keymap

    -- File searching
    keymap.set("n", "<C-P>", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>FzfLua live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>FzfLua grep_cword<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Fuzzy find open buffers" })
    -- Git commands

    -- In File searching
  end
}
