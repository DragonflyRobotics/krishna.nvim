local jdtls = require("jdtls")

local java_debug_path = vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter/extension/server/"
local bundles = vim.split(
    vim.fn.glob(java_debug_path .. "com.microsoft.java.debug.plugin-*.jar"),
    "\n",
    { trimempty = true }
)

local config = {
    cmd = { "jdtls" },
    root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" }),
    settings = { java = {} },
    init_options = { bundles = bundles },
}

jdtls.start_or_attach(config)
require("jdtls").setup_dap({ hotcodereplace = "auto" })
