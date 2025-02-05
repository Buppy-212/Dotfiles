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
        sidebars = "dark",
        floats = "dark",
      },
      on_highlights = function(hl)
        hl["@keyword.import"] = { fg = "#7dcfff", italic = true }
      end,
    })

    -- load the colorscheme
    vim.cmd([[colorscheme tokyonight]])
    vim.cmd([[se cul]])
  end,
}
