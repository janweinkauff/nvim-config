return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    opts = {
        plugins = {
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
        icons = {
        },
        win = {
            border = "rounded",
            padding = { 2, 2, 2, 2 },
            -- winblend = 0,
        },
        layout = {
            height = { min = 4, max = 25 },
            width = { min = 20, max = 50 },
            spacing = 3,
            align = "left",
        },
        show_help = true,
        triggers = "auto",
    },
    keys = {
        { "<leader>Q", "<cmd>qa!<cr>", desc = "Quit" },
        { "<leader>w", "<cmd>w!<cr>", desc = "Save" },

        -- Splits
        { "<leader>-", "<cmd>split<cr>", desc = "Create split"},
        { "<leader>|", "<cmd>vsplit<cr>", desc = "Create vsplit" },

        -- Buffers
        { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
        { "<leader>k", "<cmd>bdelete<CR>", desc = "Kill Buffer" },

        -- Find
        { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find File" },
        { "<leader>i", function() require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>') }) end, desc = "Find Text under Cursor in File" },
        { "<leader>n", "<cmd>Neotree filesystem toggle float<CR>", desc = "Float File Explorer" },

        -- Debugging
        { "<leader>d", group = "Debugging" },
        { "<leader>dd", function() require("dapui").toggle() end, desc = "Toggle debugging" },
        { "<leader>ds",
            function()
                require("dap").continue({})
                vim.cmd("tabedit %")
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", false, true, true), "n", false)
                require("dapui").toggle({})
            end,
            desc = "Start debugging" },
        { "<leader>dx",
            function()
                require("dap").disconnect()
                require("dapui").close({})
            end,
            desc = "Stop debugging", nowait = true, remap = false },
        { "<leader>dr", function() require("dap").restart() end, desc = "Restart" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint with condition" },
        { "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = "Breakpoint with log message" },
        { "<leader>dt", function() require("dap-go").debug_test() end, desc = "Debug test" },
        { "<leader>dc", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
        { "<leader>de", function() require("dap").repl.open() end, desc = "Open repl" },
        { "<leader>dk", function() require("dap.ui.widgets").hover() end, desc = "Hover" },

        -- Git
        { "<leader>g", group = "Git" },
--            { "<leader>gb", <function 1>, desc = "Branches" },
--            { "<leader>gcb", <function 1>, desc = "Buffer commits" },
--            { "<leader>gcc", <function 1>, desc = "Git commits" },
        { "<leader>gf", "<cmd>Get fetch<CR>", desc = "git fetch" },
        { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>gp", "<cmd>Git push<CR>", desc = "git push" },
        { "<leader>gs", "<cmd>Git<CR>", desc = "git status" },
        { "<leader>gz", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle git blame on line" },
        { "<leader>gh", group = "Git signs", nowait = true, remap = false },
        { "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
        { "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
        { "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
        { "<leader>ght", group = "Toggle highlights" },
        { "<leader>ghtl", "<cmd>Gitsigns toggle_linehl<CR>", desc = "Toggle line highlights" },
        { "<leader>ghtn", "<cmd>Gitsigns toggle_numhl<CR>", desc = "Toggle number highlights" },
        { "<leader>ghts", "<cmd>Gitsigns toggle_signs<CR>", desc = "Toggle signs" },
        { "<leader>ghtw", "<cmd>Gitsigns toggle_word_diff<CR>", desc = "Toggle word diff highlights" },
    },
}
