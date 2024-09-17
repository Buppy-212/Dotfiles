return {
  "echasnovski/mini.nvim",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup()
    require("mini.align").setup()
    require("mini.pairs").setup({
      mappings = {
        ["`"] = false,
        ["'"] = false,
      },
    })
    require("mini.comment").setup()
    require("mini.surround").setup()
    require("mini.indentscope").setup()
    require("mini.icons").setup()
  end,
}
