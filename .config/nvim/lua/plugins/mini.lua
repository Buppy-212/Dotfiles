return {
  "echasnovski/mini.nvim",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  config = function()
    require("mini.ai").setup()
    require("mini.pairs").setup({
      mappings = {
        ["'"] = false,
        ["`"] = false,
      },
    })
    require("mini.comment").setup()
    require("mini.surround").setup({
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    })
  end,
}
