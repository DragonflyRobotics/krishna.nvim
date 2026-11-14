return {
	{
		"petertriho/nvim-scrollbar",
		branch = "refactor/v2",
		event = "VeryLazy",
		dependencies = {
			"lewis6991/gitsigns.nvim",
		},
		config = function()
			require("scrollbar").setup({
				providers = {
					gitsigns = true,
					-- diagnostic = true, -- enabled by default in v2
					-- search = true,     -- enabled by default in v2
				},

				marks = {
					Cursor = {
						text = "•",
					},
					Search = {
						text = { "-", "=" },
					},
					Error = {
						text = { "-", "=" },
					},
					Warn = {
						text = { "-", "=" },
					},
					Info = {
						text = { "-", "=" },
					},
					Hint = {
						text = { "-", "=" },
					},
					Misc = {
						text = { "-", "=" },
					},
				},

				scrollbar = {
					show = true,
					hide_if_all_visible = true,
					throttle_ms = 50,
				},
			})
		end,
	},
}
