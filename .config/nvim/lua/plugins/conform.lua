return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>cf",
      mode = { "v" },
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      desc = "Format file or range (in visual mode)",
    },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        tex = { "latexindent -c /dev/null" },
        bib = { "bibtex-tidy" },
        markdown = { "markdownlint" },
        sh = { "shfmt" },
        python = { "autopep8", "isort" },
        lua = { "stylua" },
        css = { "prettier" },
        json = { "jq", "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        yaml = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
