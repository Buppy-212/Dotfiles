return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = { spelling = true },
    mode = { "n", "v" },
    defaults = {
      { "<leader>b", group = "buffers", icon = " " },
      { "<leader>c", group = "code" },
      { "<leader>e", group = "files" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "sessions" },
      { "<leader>m", group = "markdown", icon = "󰍔 " },
      { "<leader>n", group = "notifications" },
      { "<leader>w", proxy = "<c-w>", group = "windows" },
      { "<leader>x", group = "diagnostics/todo" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(opts.defaults)
  end,
}
