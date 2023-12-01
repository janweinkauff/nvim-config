-- Core
require("config.keymaps")
require("config.options")
require("config.lazy")

-- Config | LSP
local cfg = require("yaml-companion").setup({
    -- Built in file matchers
    builtin_matchers = {
        -- Detects Kubernetes files based on content
        kubernetes = { enabled = true },
        cloud_init = { enabled = false }
    },
    -- Pass any additional options that will be merged in the final LSP config
    lspconfig = {
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
                validate = true,
                format = { enable = true },
                hover = true,
                schemaStore = {
                    enable = true,
                    url = "https://www.schemastore.org/api/json/catalog.json",
                },
                schemaDownload = { enable = true },
                schemas = {},
                trace = { server = "debug" },
            },
        },
    },
})
require("lspconfig").yamlls.setup(cfg)

-- Config | Which-Key
require("which-key").register({
    f = {
        name = "Telescope",
        j = { "<cmd>Telescope find_files<cr>", "Find File" },
        k = { "<cmd>Telescope live_grep<cr>", "Find Text in File" },
        o = { "<cmd>Telescope oldfiles<cr>", "Find recent File" },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
        r = { "<cmd>Telescope registers<cr>", "Find Register" },
        c = { "<cmd>Telescope commands<cr>", "Find Command" },
        m = { "<cmd>Telescope keymaps<cr>", "Find Keymap" },
        u = { "<cmd>lua require('telescope').extensions.undo.undo()<cr>", "Find in Undo Tree" },
        y = { "<cmd>YAMLTelescope<cr>", "Find in YAML" },
    },
    h = { function() require("harpoon.ui").toggle_quick_menu() end, "Harpoon" }
}, { prefix = "<leader>" })
