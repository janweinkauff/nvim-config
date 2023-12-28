return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
    },
    config = function()
        local status_ok, which_key = pcall(require, "which-key")
        if not status_ok then
            return
        end

        local setup = {
            plugins = {
                marks = true,         -- shows a list of your marks on ' and `
                registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = true,      -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = true,      -- default bindings on <c-w>
                    nav = true,          -- misc bindings to work with windows
                    z = true,            -- bindings for folds, spelling and others prefixed with z
                    g = true,            -- bindings for prefixed with g
                },
            },
            -- add operators that will trigger motion and text object completion
            -- to enable all native operators, set the preset / operators plugin above
            -- operators = { gc = "Comments" },
            key_labels = {
                -- override the label used to display some keys. It doesn't effect WK in any other way.
                -- For example:
                -- ["<space>"] = "SPC",
                -- ["<cr>"] = "RET",
                -- ["<tab>"] = "TAB",
            },
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
            },
            popup_mappings = {
                scroll_down = "<c-d>", -- binding to scroll down inside the popup
                scroll_up = "<c-u>",   -- binding to scroll up inside the popup
            },
            window = {
                border = "rounded",       -- none, single, double, shadow
                position = "bottom",      -- bottom, top
                margin = { 1, 1, 1, 1 },  -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
            layout = {
                height = { min = 4, max = 25 },                                           -- min and max height of the columns
                width = { min = 20, max = 50 },                                           -- min and max width of the columns
                spacing = 3,                                                              -- spacing between columns
                align = "left",                                                           -- align columns left, center or right
            },
            ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
            show_help = true,                                                             -- show help message on the command line when the popup is visible
            triggers = "auto",                                                            -- automatically setup triggers
            -- triggers = {"<leader>"} -- or specify a list manually
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                -- this is mostly relevant for key maps that start with a native binding
                -- most people should not need to change this
                i = { "j", "k" },
                v = { "j", "k" },
            },
        }

        local opts = {
            mode = "n",     -- NORMAL mode
            prefix = "<leader>",
            buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true,  -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = true,  -- use `nowait` when creating keymaps
        }

        local mappings = {
            k = { "<cmd>bdelete<CR>", "Kill Buffer" },
            p = { "<cmd>Lazy<CR>", "Plugin Manager" },
            w = { "<cmd>w!<CR>", "Save" },
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
            l = {
                name = "LSP",
                a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                i = { "<cmd>LspInfo<cr>", "Info" },
                l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
                r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
                S = {
                    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                    "Workspace Symbols",
                },
            },
            h = {
                name = "Harpoon",
                a = { require("harpoon.mark").add_file, "Add file to harpoon" },
                l = { require("harpoon.ui").toggle_quick_menu, "Toggle quick menu" },
                r = { require("harpoon.mark").rm_file, "Remove file from harpoon" },
            },
            t = {
                name = "Terminal",
                g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Git" },
                f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
                h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
                v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
            },
            g = {
                name = "Git",
                b = { require("telescope.builtin").git_branches, "Branches" },
                c = {
                    b = { require("telescope.builtin").git_bcommits, "Buffer commits" },
                    c = { require("telescope.builtin").git_commits, "Git commits" },
                },
                -- Signs
                h = {
                name = "Git signs",
                    p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview hunk" },
                    r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset hunk" },
                    s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage hunk" },
                    -- Toggle highlights
                    t = {
                        name = "Toggle highlights",
                        b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle git blame on line" },
                        l = { "<cmd>Gitsigns toggle_linehl<CR>", "Toggle line highlights" },
                        n = { "<cmd>Gitsigns toggle_numhl<CR>", "Toggle number highlights" },
                        s = { "<cmd>Gitsigns toggle_signs<CR>", "Toggle signs" },
                        w = { "<cmd>Gitsigns toggle_word_diff<CR>", "Toggle word diff highlights" },
                    },
                },
                p = { "<cmd>Git push<CR>", "git push" },
                s = { "<cmd>Git<CR>", "git status" },
                f = { "<cmd>Get fetch<CR>", "git fetch" },
                z = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle git blame on line" },
            },
            y = { '"+y', "Copy to system clipboard", mode = "v" }
        }

        which_key.setup(setup)
        which_key.register(mappings, opts)
    end
}
