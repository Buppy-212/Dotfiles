return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  --stylua: ignore
  keys = {
    { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Rename" },
    { "<leader>cd", function() vim.lsp.buf.definition() end, desc = "Definition" },
    { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Action" },
    { "<leader>ch", function() vim.lsp.buf.hover() end, desc = "Hover" },
  },
  opts = {
    servers = {
      bashls = {},
      html = {},
      hyprls = {},
      jsonls = {},
      marksman = {},
      rust_analyzer = {},
      taplo = {},
      texlab = {},
      ts_ls = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim", "Snacks" } },
          },
        },
      },
      pylsp = {
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
      },
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
