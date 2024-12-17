return {
  "folke/todo-comments.nvim",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ft", "<cmd>TodoFzfLua<cr>", desc = "Todo" },
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
