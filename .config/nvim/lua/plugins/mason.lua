return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig",
  },
  event = "VeryLazy",
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end,
}
