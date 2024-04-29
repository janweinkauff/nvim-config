return {
    jsonls = {
        settings = {
            json = {
                schema = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    },
    terraformls = {
        cmd = { "terraform-ls" },
        arg = { "server" },
        filetypes = { "terraform", "tf", "terraform-vars" },
    },
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        "${3rd}/luv/library",
                        unpack(vim.api.nvim_get_runtime_file("", true)),
                    },
                },
                completion = {
                    callSnippet = "Replace",
                },
            },
        },
    },
    bashls = {
        filetypes = { "sh", "zsh" },
    },
    vimls = {
        filetypes = { "vim" },
    },
    gopls = {},
    solidity_ls_nomicfoundation = {},
    yamlls = {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml" },
    },
    dartls = {
        cmd = { "dart", "language-server", "--protocol=lsp" },
    },
}
