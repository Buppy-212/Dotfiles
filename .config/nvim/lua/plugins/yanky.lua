return {
  "gbprod/yanky.nvim",
  lazy = true,
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  opts = {
    highlight = { timer = 150 },
  },
  keys = {
    { "<leader>fp", "<cmd>YankyRingHistory<cr>", desc = "Clipboard" },
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
    { "p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
    { "P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
    { "gp", "<Plug>(YankyGPutAfterCharwiseJoined)", mode = { "n", "x" }, desc = "Put Text After Selection (Trimed)" },
    { "gP", "<Plug>(YankyGPutBeforeCharwiseJoined)", mode = { "n", "x" }, desc = "Put Text Before Selection (Trimed)" },
    { "zp", "<Plug>(YankyGPutAfterCharwise)", mode = { "n", "x" }, desc = "Put Text After Selection" },
    { "zP", "<Plug>(YankyGPutBeforeCharwise)", mode = { "n", "x" }, desc = "Put Text Before Selection" },
    { "<C-P>", "<Plug>(YankyPreviousEntry)", desc = "Cycle Forward Through Yank History" },
    { "<C-N>", "<Plug>(YankyNextEntry)", desc = "Cycle Backward Through Yank History" },
  },
}
