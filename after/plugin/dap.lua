local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

-- Dap Virtual Text
dap_virtual_text.setup()


mason_dap.setup({
    ensure_installed = { "cppdbg", "node2", "python", "javadbg" },
    automatic_installation = true,
    handlers = {
        function(config)
            require("mason-nvim-dap").default_setup(config)
        end,
    },
})

dap.adapters.python = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
    args = { "-m", "debugpy.adapter" },
}


dap.configurations.java = {
    {
        type = "java", -- must match adapter type from JDTLS
        request = "launch",
        name = "Debug Current File",
        mainClass = function()
            return vim.fn.input("Main class (e.g., com.example.Main): ")
        end,
        projectName = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
        cwd = vim.fn.getcwd(),
    },
}


-- Dap UI

ui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end
