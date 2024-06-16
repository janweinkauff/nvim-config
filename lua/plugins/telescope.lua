return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'debugloop/telescope-undo.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local trouble = require("trouble.sources.telescope")
        local actions = require("telescope.actions")
        local icons = require("config.icons")
        require("telescope").setup({
            file_ignore_patterns = { "%.git/." },
            defaults = {
                mappings = {
                    i = {
                        ["<c-t>"] = trouble.open_with_trouble,
                        ["<esc>"] = actions.close,
                    },
                    n = { ["<c-t>"] = trouble.open_with_trouble },
                },
                path_display = {
                    "filename_first",
                },
                previewer = true,
                prompt_prefix = " " .. icons.ui.Telescope .. " ",
                selection_caret = icons.ui.BoldArrowRight .. " ",
                file_ignore_patterns = { "node_modules", "package-lock.json" },
                initial_mode = "insert",
                select_strategy = "reset",
                sorting_strategy = "ascending",
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                layout_config = {
                    prompt_position = "top",
                    preview_cutoff = 120,
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--glob=!.git/",
                },
            },
            pickers = {
                find_files = {
                    previewer = false,
                    layout_config = {
                        height = 0.4,
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                live_grep = {
                    previewer = true,
                    only_sort_text = true,
                    layout_config = {
                        height = 0.4,
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                git_files = {
                    previewer = true,
                    layout_config = {
                        height = 0.4,
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                buffers = {
                    mappings = {
                        i = {
                            ["<c-d>"] = actions.delete_buffer,
                        },
                        n = {
                            ["<c-d>"] = actions.delete_buffer,
                        },
                    },
                    previewer = false,
                    initial_mode = "normal",
                    layout_config = {
                        height = 0.4,
                        width = 0.6,
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                registers = {
                    previewer = false,
                    initial_mode = "normal",
                    layout_config = {
                        height = 0.4,
                        width = 0.6,
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                current_buffer_fuzzy_find = {
                    previewer = true,
                    layout_config = {
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                grep_string = {
                    only_sort_text = true,
                    previewer = true,
                },
                lsp_references = {
                    show_line = false,
                    previewer = true,
                },
                treesitter = {
                    show_line = false,
                    previewer = true,
                },
                colorscheme = {
                    enable_preview = true,
                },
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
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                },
            },
        })
        require("telescope").load_extension("undo")
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('notify')
    end,
}
