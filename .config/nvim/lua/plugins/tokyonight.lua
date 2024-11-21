return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    require("tokyonight").setup({
      transparent = true,
      style = "storm",
      terminal_colors = true,
      styles = {
        keywords = { bold = true },
        functions = { bold = true },
        constructors = { bold = true },
        sidebars = "transparent",
        floats = "dark",
      },
    })
    -- load the colorscheme
    vim.cmd([[colorscheme tokyonight]])
    vim.cmd([[se cul]])
  end,
}
