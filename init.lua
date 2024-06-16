-- Core
require("config.keymaps")
require("config.options")
require("config.lazy")

-- Config | LSP
local cfg = require("yaml-companion").setup({
    builtin_matchers = {
        kubernetes = { enabled = true },
        cloud_init = { enabled = false }
    },
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
        -- on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
    }
end

-- Autocmd

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.templ",
  callback = function()
    vim.lsp.buf.format()
  end
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end
})

-- Initialize vscode launch configurations
require("dap.ext.vscode").load_launchjs()  
