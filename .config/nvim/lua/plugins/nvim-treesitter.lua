return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  init = function()
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.treesitter.language.register("markdown", "vimwiki")
    vim.filetype.add({
      pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    })
    vim.filetype.add({
      extension = {
        zsh = "sh",
        sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
      },
      filename = {
        [".zshrc"] = "sh",
        [".zshenv"] = "sh",
      },
    })
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "latex" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-Space>",
          node_incremental = "<C-Space>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },
      indent = {
        enable = true,
      },
    })
  end,
}
