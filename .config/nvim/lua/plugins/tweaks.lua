return {
	{
		"folke/snacks.nvim",
		opts = {
			image = {
				enabled = true,
				markdown = {
					float = true,
					inline = false,
				},
			},
			statuscolumn = { enabled = true },
			picker = {
				win = {
					input = {
						keys = {
							["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
						},
					},
				},
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "norg", "rmd", "org", "codecompanion", "quarto" },
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				tex = { "latexindent" },
			},
			formatters = {
				latexindent = {
					args = { "-g", "/dev/null" },
				},
			},
		},
	},
}
