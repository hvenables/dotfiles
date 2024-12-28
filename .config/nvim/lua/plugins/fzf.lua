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
        cmd = "rg --files --hidden --glob '!*.rbi'",
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<C-P>", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
  end
}
