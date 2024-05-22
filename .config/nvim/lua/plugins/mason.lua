return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-lint",
    "mhartington/formatter.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({})
      end,
      vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" }),
    })
  end,
}
