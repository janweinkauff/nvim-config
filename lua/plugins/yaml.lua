return {
    "cuducos/yaml.nvim",
    ft = { "yaml" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved" }, {
            pattern = { "*.yaml" },
            callback = function()
                vim.opt_local.winbar = require("yaml_nvim").get_yaml_key()
            end,
        })
    end
}
