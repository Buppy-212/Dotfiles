return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    {
      "<leader>xn",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next todo",
    },
    {
      "<leader>xp",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous todo",
    },
  },
  opts = {},
}
