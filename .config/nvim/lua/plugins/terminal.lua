return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = true,
  keys = {
    { "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Terminal" },
  },
  opts = { persist_mode = false, start_in_insert = true },
}
