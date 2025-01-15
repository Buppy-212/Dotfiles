return {
  "milanglacier/yarepl.nvim",
  lazy = true,
  opts = {
    metas = {
      aichat = false,
      radian = false,
      python = false,
      bash = false,
    },
  },
  keys = {
    { "<leader>ra", "<cmd>REPLAttachBufferToREPL<CR>", desc = "Attach" },
    { "<leader>rd", "<cmd>REPLDetachBufferToREPL<CR>", desc = "Detach" },
    { "<leader>rh", "<cmd>REPLHideOrFocus<CR>", desc = "Hide" },
    { "<leader>rr", "<cmd>REPLSendLine<CR>", desc = "Exec Line" },
    { "<leader>rs", "<cmd>REPLStart<CR>", desc = "REPL" },
    { "<leader>rz", "<cmd>REPLStart zsh<CR>", desc = "zsh" },
    { "<leader>rp", "<cmd>REPLStart ipython<CR>", desc = "ipython" },
    { "<leader>rR", "<cmd>REPLStart R<CR>", desc = "R" },
    { "<leader>rq", "<cmd>REPLClose<CR>", desc = "Close" },
    { "<leader>r", mode = "v", "<cmd>REPLSendVisual<CR>", desc = "Exec Selected" },
    { "<C-k>", mode = "t", "<C-\\><C-n><C-w>w", silent = true },
  },
}
