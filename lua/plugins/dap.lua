vim.fn.sign_define("DapBreakpoint", {
	text = "●",
	texthl = "DapBreakpointSign",
	linehl = "",
	numhl = "",
})
vim.api.nvim_set_hl(0, "DapBreakpointSign", {
	fg = "#ff5555", -- red dot
	bold = true,
})
vim.fn.sign_define("DapStopped", {
	text = "▶",
	texthl = "DapStoppedSign",
	linehl = "Visual",
	numhl = "",
})

vim.api.nvim_set_hl(0, "DapStoppedSign", {
	fg = "#50fa7b",
	bold = true,
})
return {
	"mfussenegger/nvim-dap",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",

		-- language specific
		"mfussenegger/nvim-dap-python",

		-- mason
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		------------------------------------------------------------------
		-- Core
		------------------------------------------------------------------
		local dap = require("dap")
		local dapui = require("dapui")

		------------------------------------------------------------------
		-- Mason
		------------------------------------------------------------------
		require("mason").setup()

		require("mason-nvim-dap").setup({
			ensure_installed = {
				"debugpy",
				"codelldb",
			},

			automatic_installation = true,

			handlers = {
				-- default automatic setup
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,

				-- custom codelldb config
				codelldb = function(config)
					config.configurations = {
						{
							name = "Launch file",
							type = "codelldb",
							request = "launch",

							program = function()
								return vim.fn.input(
									"Path to executable: ",
									vim.fn.getcwd() .. "/target/debug/",
									"file"
								)
							end,

							cwd = "${workspaceFolder}",
							stopOnEntry = false,
						},
					}

					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		------------------------------------------------------------------
		-- UI
		------------------------------------------------------------------
		dapui.setup()

		require("nvim-dap-virtual-text").setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		------------------------------------------------------------------
		-- Keymaps
		------------------------------------------------------------------
		vim.keymap.set("n", "<F5>", dap.continue)
		vim.keymap.set("n", "<F10>", dap.step_over)
		vim.keymap.set("n", "<F11>", dap.step_into)
		vim.keymap.set("n", "<F12>", dap.step_out)

		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)

		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)

		vim.keymap.set("n", "<Leader>dr", dap.repl.open)
		vim.keymap.set("n", "<Leader>dl", dap.run_last)
		vim.keymap.set("n", "<Leader>du", dapui.toggle)
	end,
}
