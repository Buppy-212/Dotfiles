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
}
