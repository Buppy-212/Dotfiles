return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  lazy = true,
  init = function()
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrw = 1
  end,
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
