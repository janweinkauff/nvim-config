return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_modified_markers = true,
            enable_diagnostics = true,
            sort_case_insensitive = true,
            default_component_configs = {
                indent = {
                    with_markers = true,
                    with_expanders = true,
                },
                modified = {
                    symbol = " ",
                    highlight = "NeoTreeModified",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "",
                        deleted = "",
                        modified = "",
                        renamed = "",
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            commands = {
                copy_selector = function(state)
                local node = state.tree:get_node()
                local filepath = node:get_id()
                local filename = node.name
                local modify = vim.fn.fnamemodify

                local vals = {
                    ["BASENAME"] = modify(filename, ":r"),
                    ["EXTENSION"] = modify(filename, ":e"),
                    ["FILENAME"] = filename,
                    ["PATH (CWD)"] = modify(filepath, ":."),
                    ["PATH (HOME)"] = modify(filepath, ":~"),
                    ["PATH"] = filepath,
                    ["URI"] = vim.uri_from_fname(filepath),
                }

                local options = vim.tbl_filter(
                    function(val)
                    return vals[val] ~= ""
                    end,
                    vim.tbl_keys(vals)
                )
                if vim.tbl_isempty(options) then
                    vim.notify("No values to copy", vim.log.levels.WARN)
                    return
                end
                table.sort(options)
                vim.ui.select(options, {
                    prompt = "Choose to copy to clipboard:",
                    format_item = function(item)
                    return ("%s: %s"):format(item, vals[item])
                    end,
                }, function(choice)
                    local result = vals[choice]
                    if result then
                    vim.notify(("Copied: `%s`"):format(result))
                    vim.fn.setreg("+", result)
                    end
                end)
                end,
            },
            window = {
                position = "float",
                width = 35,
                mappings = {
                    Y = "copy_selector",
                },
            },
            filesystem = {
                use_libuv_file_watcher = true,
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        "node_modules",
                    },
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
            },
            follow_current_file = {
                enabled = true,          -- This will find and focus the file in the active buffer every time
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            hijack_netrw_behavior = "open_current",
            event_handlers = {
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
                {
                    event = "neo_tree_window_after_close",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
            },
        })
    end,
}
