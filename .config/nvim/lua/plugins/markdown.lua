return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    opts = {
      code = {
        width = "block",
        right_pad = 1,
      },
      pipe_table = {
        preset = "round",
      },
      sign = {
        enabled = false,
        highlight = "RenderMarkdownSign",
      },
      latex = {
        enabled = false,
      },
    },
  },
  {
    "3rd/image.nvim",
    ft = "markdown",
    opts = {
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
        },
      },
      window_overlap_clear_enabled = true,
    },
  },
}
