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
		"mason-org/mason.nvim",
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
				"python",
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

        local debugpy_python = vim.fn.stdpath("data")
        .. "/mason/packages/debugpy/venv/bin/python"

        require("dap-python").setup(debugpy_python)

        local cpp_configurations = {
            {
                name = "Launch C/C++ binary",
                type = "codelldb",
                request = "launch",

                program = function()
                    return vim.fn.input(
                        "Path to executable: ",
                        vim.fn.getcwd() .. "/build/",
                        "file"
                    )
                end,

                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }

        dap.configurations.c = cpp_configurations
        dap.configurations.cpp = cpp_configurations

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

        vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, {
          desc = "Debug: run to cursor",
        })

        vim.keymap.set("n", "<leader>dt", dap.terminate, {
          desc = "Debug: terminate",
        })

        vim.keymap.set({ "n", "v" }, "<leader>de", function()
          dapui.eval()
        end, {
          desc = "Debug: evaluate expression",
        })

        vim.keymap.set("n", "<leader>dn", function()
          require("dap-python").test_method()
        end, {
          desc = "Debug nearest Python test",
        })

	end,
}
