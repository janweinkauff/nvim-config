return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "HiPhish/nvim-ts-rainbow2"
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_install = false,
            ignore_install = { "javascript" },
            modules = {},
            highlight = {
                enable = true,    -- false will disable the whole extension
                disable = { "" }, -- list of language that will be disabled
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = true },
            auto_install = true,
            ensure_installed = {
                "c",
                "cpp",
                "python",
                "lua",
                "yaml",
                "bash",
                "go", "gosum", "gomod", "gowork",
                "vim", "vimdoc",
                "query",
                "json", "typescript", "jq", "javascript", "jsonnet",
                "rego",
                "toml",
                "html",
                "gitignore", "git_config", "git_rebase", "gitcommit",
                "java",
                "make",
                "markdown", "markdown_inline",
                "terraform", "hcl",
                "http",
                "regex",
                "promql",
                "passwd"
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>vv",
                    node_incremental = "+",
                    node_decremental = "_",
                    scope_incremental = false,
                }
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = { query = "@function.outer", desc = "around a function" },
                        ["if"] = { query = "@function.inner", desc = "inner part of a function" },
                        ["ac"] = { query = "@class.outer", desc = "around a class" },
                        ["ic"] = { query = "@class.inner", desc = "inner part of a class" },
                        ["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
                        ["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
                        ["al"] = { query = "@loop.outer", desc = "around a loop" },
                        ["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
                        ["ap"] = { query = "@parameter.outer", desc = "around parameter" },
                        ["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
                    },
                    selection_modes = {
                        ["@parameter.outer"] = "v",   -- charwise
                        ["@parameter.inner"] = "v",   -- charwise
                        ["@function.outer"] = "v",    -- charwise
                        ["@conditional.outer"] = "V", -- linewise
                        ["@loop.outer"] = "V",        -- linewise
                        ["@class.outer"] = "<c-v>",   -- blockwise
                    },
                    include_surrounding_whitespace = false,
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_previous_start = {
                        ["[f"] = { query = "@function.outer", desc = "Previous function" },
                        ["[c"] = { query = "@class.outer", desc = "Previous class" },
                        ["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
                    },
                    goto_next_start = {
                        ["]c"] = { query = "@class.outer", desc = "Next class" },
                        ["]f"] = { query = "@function.outer", desc = "Next function" },
                        ["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>a"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner",
                    },
                },
            },
            rainbow = {
                enable = true,
                -- list of languages you want to disable the plugin for
                -- disable = { "jsx", "cpp" },
                -- Which query to use for finding delimiters
                query = 'rainbow-parens',
                -- Highlight the entire buffer all at once
                strategy = require 'ts-rainbow.strategy.global',
                -- Do not enable for files with more than n lines
                max_file_lines = 3000
            }
        })
    end,
}
