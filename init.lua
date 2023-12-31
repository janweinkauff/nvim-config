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
            lua = {
                diagnostics = {
                    globals = { 'vim' },
                },
            },
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

require("lspconfig").tailwindcss.setup({
    filetypes = {
        'templ'
    },
    init_options = {
        userLanguages = {
            templ = "html"
        }
    }
})

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

local servers = { 'gopls', 'ccls', 'cmake', 'tsserver', 'templ' }
for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
    }
end

-- Auto Actions on save
local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup ' .. group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

nvim_create_augroups({
    go_save = {
        { "BufWritePre", "*.go", "lua vim.lsp.buf.format()" },
        { "BufWritePre", "*.go", ":%! goimports" },
    },
    temple_save = {
        { "BufWritePre", "*.templ", "lua vim.lsp.buf.format()" }
    }
})
