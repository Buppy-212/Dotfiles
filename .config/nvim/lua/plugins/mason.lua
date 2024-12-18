return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig",
    "stevearc/conform.nvim",
  },
  event = "VeryLazy",
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require("mason-lspconfig").setup_handlers({
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
      end,
    })
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim", "Snacks" } },
        },
      },
    })
    require("lspconfig").pylsp.setup({
      settings = {
        configurationSources = "flake8",
        pylsp = {
          plugins = {
            pycodestyle = {
              enabled = false,
            },
            autopep8 = {
              enabled = false,
            },
            flake8 = {
              ignore = { "E123", "E128", "E401", "E501", "F401", "F403", "F405", "W391", "W504" },
              enabled = true,
              indentSize = 4,
            },
            pyflakes = {
              enabled = false,
            },
            mccabe = {
              enabled = false,
            },
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>cr", "<cmd> lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
    vim.keymap.set("n", "<leader>cd", "<cmd> lua vim.lsp.buf.definition()<cr>", { desc = "Definition" })
    vim.keymap.set("n", "<leader>ca", "<cmd> lua vim.lsp.buf.code_action()<cr>", { desc = "Action" })
    vim.keymap.set("n", "<leader>ch", "<cmd> lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
  end,
}
