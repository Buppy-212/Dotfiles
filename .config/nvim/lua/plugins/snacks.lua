return {
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				win = {
					input = {
						keys = {
							["g."] = { "toggle_hidden", mode = { "i", "n" } },
						},
					},
				},
			},
		},
	},
}
