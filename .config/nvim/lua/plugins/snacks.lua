return {
	{
		"folke/snacks.nvim",
		opts = {
			image = { enabled = true },
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
