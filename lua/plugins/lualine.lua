return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "meuter/lualine-so-fancy.nvim", -- small improved variants over the default components
    },
    enabled = true,
    lazy = false,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto',
                icons_enabled = true,
                globalstatus = false,
                component_separators = { left = "|", right = "|" },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {
                        "alfa-nvim",
                        "help",
                        "neo-tree",
                        "Trouble",
                        "spectre_panel",
                        "toggleterm",
                    },
                    winbar = {},
                },
            },
            sections = {
                lualine_a = { 'fancy_mode' },
                lualine_b = { "fancy_branch", },
                lualine_c = {
                    { "filename", path = 1, symbols = { modified = "  ", readonly = "  ", unnamed = "  ", }, },
                    { "fancy_diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
                    { "fancy_searchcount" },
                },
                lualine_x = {
                    "fancy_lsp_servers",
                    "fancy_diff",
                    "progress",
                },
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = { "neo-tree", "lazy" },
        })
    end,
}
