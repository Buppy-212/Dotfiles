return {
  "echasnovski/mini.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup()
    require("mini.align").setup()
    require("mini.pairs").setup()
    require("mini.comment").setup()
    require("mini.surround").setup()
    require("mini.indentscope").setup()
  end,
}
