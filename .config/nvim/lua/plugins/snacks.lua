return {
	{
		"folke/snacks.nvim",
		opts = {
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
}
