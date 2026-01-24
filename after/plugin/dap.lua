local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

-- Dap Virtual Text
dap_virtual_text.setup()


mason_dap.setup({
    ensure_installed = { "python", "javadbg", "codelldb" },
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

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        -- Change this to your path!
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false
    },
}

-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "codelldb",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = false,
--     },
-- }

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input(
                'Path to executable: ',
                vim.fn.getcwd() .. '/a.out', -- CHANGE DEFAULT HERE
                'file'
            )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}


dap.configurations.c = dap.configurations.cpp
dap.configurations.cuda = dap.configurations.cpp


local function get_python_path(workspace)
    if vim.env.VIRTUAL_ENV then
        return vim.env.VIRTUAL_ENV .. "/bin/python"
    end
    local venv = workspace .. "/.venv/bin/python"
    if vim.fn.executable(venv) == 1 then
        return venv
    end
    return "/usr/bin/python"
end
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            return get_python_path(vim.fn.getcwd())
        end,
    },
}

-- Dap UI

ui.setup()

vim.o.signcolumn = "yes"


-- DAP Signs
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = '', numhl = '' })

-- Highlight Groups (colors)
vim.cmd([[
  augroup DapColors
    autocmd!
    autocmd ColorScheme * hi DapBreakpoint guifg=#ff5555
    autocmd ColorScheme * hi DapBreakpointCondition guifg=#f1fa8c
    autocmd ColorScheme * hi DapLogPoint guifg=#8be9fd
    autocmd ColorScheme * hi DapStopped guifg=#50fa7b
  augroup END
]])



dap.listeners.after.event_initialized["dapui_config"] = function()
    ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    ui.close()
end


-- dap.listeners.before.event_terminated.dapui_config = function()
--     ui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--     ui.close()
-- end
