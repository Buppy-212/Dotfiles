return {
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
}
