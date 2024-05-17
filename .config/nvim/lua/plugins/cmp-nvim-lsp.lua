return {
  "hrsh7th/cmp-nvim-lsp",
  config = function()
    require("cmp").setup({
      sources = {
        { name = "nvim_lsp" },
      },
    })
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
    require("lspconfig").clangd.setup({
      capabilities = capabilities,
    })
    require("lspconfig").rust_analyzer.setup({
      capabilities = capabilities,
    })
    require("lspconfig").jedi_language_server.setup({
      capabilities = capabilities,
    })
    require("lspconfig").bashls.setup({
      capabilities = capabilities,
    })
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
    })
    require("lspconfig").texlab.setup({
      capabilities = capabilities,
    })
    require("lspconfig").marksman.setup({
      capabilities = capabilities,
    })
  end,
}
