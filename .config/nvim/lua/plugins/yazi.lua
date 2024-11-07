return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>ee",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Yazi",
    },
  },
  opts = {
    floating_window_scaling_factor = 1,
    open_for_directories = true,
  },
}
