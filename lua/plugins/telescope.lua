return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'debugloop/telescope-undo.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local trouble = require("trouble.providers.telescope")
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<c-t>"] = trouble.open_with_trouble,
                        ["<esc>"] = actions.close,
                    },
                    n = { ["<c-t>"] = trouble.open_with_trouble }
                }
            },

            extensions = {
                undo = {
                    use_delta = true,
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
            },
        })
        require("telescope").load_extension("undo")
        require('telescope').load_extension('fzf')
    end,
}
