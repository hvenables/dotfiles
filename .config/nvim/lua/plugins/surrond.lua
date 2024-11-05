return {
  "kylechui/nvim-surround",
  dependencies = {
    "tpope/vim-repeat"
  },
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
