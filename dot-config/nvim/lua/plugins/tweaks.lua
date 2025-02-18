return {
	{
		"folke/snacks.nvim",
		opts = {
			image = {
				enabled = true,
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
	{
		"R-nvim/R.nvim",
		opts = {
			pdfviewer = "zathura",
		},
	},
}
