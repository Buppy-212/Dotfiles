return {
  "milanglacier/yarepl.nvim",
  lazy = true,
  opts = {},
  keys = {
    { "<leader>ra", "<cmd>REPLAttachBufferToREPL<CR>", desc = "Attach" },
    { "<leader>rd", "<cmd>REPLDetachBufferToREPL<CR>", desc = "Detach" },
    { "<leader>rh", "<cmd>REPLHideOrFocus<CR>", desc = "Detach" },
    { "<leader>rr", "<cmd>REPLSendLine<CR>", desc = "Exec Line" },
    { "<leader>rs", "<cmd>REPLStart<CR>", desc = "REPL" },
    { "<leader>rq", "<cmd>REPLClose<CR>", desc = "Close" },
    { "<leader>r", mode = "v", "<cmd>REPLSendVisual<CR>", desc = "Exec Selected" },
    { "<C-Space>", mode = "t", "<C-\\><C-n><C-w>w", silent = true },
  },
}
