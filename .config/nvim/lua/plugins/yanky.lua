return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    highlight = { timer = 150 },
  },
  keys = {
    { "<leader>fp", "<cmd>Telescope yank_history<cr>", desc = "Clipboard" },
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
    { "p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
    { "P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
    { "gp", "<Plug>(YankyGPutAfterCharwiseJoined)", mode = { "n", "x" }, desc = "Put Text After Selection" },
    { "gP", "<Plug>(YankyGPutBeforeCharwiseJoined)", mode = { "n", "x" }, desc = "Put Text Before Selection" },
    { "<C-P>", "<Plug>(YankyPreviousEntry)", desc = "Cycle Forward Through Yank History" },
    { "<C-N>", "<Plug>(YankyNextEntry)", desc = "Cycle Backward Through Yank History" },
  },
}
