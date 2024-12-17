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
      { "<leader>d", group = "debug" },
      { "<leader>e", group = "files" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>g", group = "git" },
      { "<leader>r", group = "REPL", icon = " " },
      { "<leader>s", group = "Scratch", icon = " " },
      { "<leader>u", group = "ui" },
      { "<leader>v", proxy = "\\l", group = "vimtex", icon = " " },
      { "<leader>w", proxy = "<c-w>", group = "windows" },
      { "<leader>x", group = "diagnostics" },
      { "<leader>z", group = "folds", icon = "" },
      { "[", group = "prev" },
      { "]", group = "next" },
      { "g", group = "goto" },
      { "gs", group = "surround" },
      { "z", group = "fold" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(opts.defaults)
  end,
}
