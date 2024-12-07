return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>cf",
      mode = { "n", "v" },
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      desc = "Format",
    },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        bib = { "bibtex-tidy" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        json = { "jq", "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "yapf", "isort", "docformatter" },
        sh = { "shfmt" },
        tex = { "latexindent" },
        yaml = { "prettier" },
      },
      formatters = {
        yapf = {
          args = {
            "--style",
            "{based_on_style: yapf, indent_width: 4, continuation_indent_width: 4, continuation_align_style: fixed, column_limit: 100}",
          },
        },
        latexindent = {
          args = { "-g", "/dev/null" },
        },
        docformatter = {
          args = { "--in-place", "$FILENAME" },
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
