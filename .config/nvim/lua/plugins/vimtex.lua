return {
  "lervag/vimtex",
  ft = { "tex" },
  init = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura_simple"
    vim.g.vimtex_indent_enabled = 0
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_completion_enabled = 0
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_syntax_conceal_disable = 1
  end,
}
