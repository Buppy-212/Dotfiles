return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  lazy = true,
  keys = {
    {
      "<leader>eo",
      function()
        require("oil").open()
      end,
      desc = "Oil",
    },
  },
  opts = {
    keymaps = {
      ["<ESC>"] = { "actions.close", mode = "n" },
      ["<BS>"] = { "actions.parent", mode = "n" },
      ["h"] = { "actions.parent", mode = "n" },
      ["l"] = { "actions.select", mode = "n" },
    },
    show_hidden = true,
  },
}
