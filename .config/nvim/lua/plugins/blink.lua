return {
	"saghen/blink.cmp",
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "tex" } })
				require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			keys = {
				{
					"<C-J>",
					mode = { "i", "s" },
					function()
						if require("luasnip").choice_active() then
							require("luasnip").change_choice(1)
						end
					end,
				},
				{
					"<C-K>",
					mode = { "i", "s" },
					function()
						if require("luasnip").choice_active() then
							require("luasnip").change_choice(-1)
						end
					end,
				},
			},
		},
	},
	opts = {
		keymap = {
			preset = "default",
			["<C-space>"] = { "show", "select_and_accept" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-l>"] = { "snippet_forward" },
			["<C-h>"] = { "snippet_backward" },
			["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" },
			["<C-d>"] = { "scroll_documentation_down" },
			["<C-u>"] = { "scroll_documentation_up" },
		},
		sources = {
			providers = {
				snippets = {
					min_keyword_length = 1,
				},
			},
		},
	},
}
