return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    require("copilot").setup({})
    require("copilot_cmp").setup()
  end
}
