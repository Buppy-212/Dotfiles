return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  opts = { signcolumn = false, numhl = true },
  keys = {
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
    { "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
    { "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
  },
}
