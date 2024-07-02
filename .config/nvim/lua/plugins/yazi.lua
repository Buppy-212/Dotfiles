return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fY",
      function()
        require("yazi").yazi()
      end,
      desc = "Open Yazi",
    },
    {
      "<leader>fy",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open Yazi (CWD)",
    },
  },
  opts = {
    open_for_directories = true,
  },
}
