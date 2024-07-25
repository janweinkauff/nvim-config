return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        win = {
            border = "rounded",
            padding = { 2, 2, 2, 2 },
        },
    },
    keys = {
        -- General
        { "<leader>Q", "<cmd>qa!<cr>", desc = "Quit" },
        { "<leader>w", "<cmd>w!<cr>", desc = "Save" },

        -- Splits
        { "<leader>-", "<cmd>split<cr>", desc = "Create split"},
        { "<leader>|", "<cmd>vsplit<cr>", desc = "Create vsplit" },
        { "<leader>c", "<cmd>close<cr>", desc = "Close split" },

        -- Buffers
        { "<leader>n", "<cmd>Neotree filesystem toggle float<CR>", desc = "Float File Explorer" },
        { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
        { "<leader>k", "<cmd>bdelete<CR>", desc = "Kill Buffer" },

        -- Find
        { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find File" },
        { "<leader>I", function() require('telescope.builtin').live_grep() end, desc = "Find Text from selection", mode = "n" },
        { "<leader>I",
            function()
                vim.cmd('noau normal! "vy"')
                local text = vim.fn.getreg('v')
                vim.fn.setreg('v', {})
                text = string.gsub(text, "\n", "")
                require('telescope.builtin').live_grep({ default_text = text })
            end, desc = "Find Text from selection", mode = "v" },
        { "<leader>i", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find Text in current Buffer" },
        { "<leader>i",
            function()
                vim.cmd('noau normal! "vy"')
                local text = vim.fn.getreg('v')
                vim.fn.setreg('v', {})
                text = string.gsub(text, "\n", "")
                require('telescope.builtin').current_buffer_fuzzy_find({ default_text = text })
            end, desc = "Find Text from selection", mode = "v" },

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
        { "<leader>gb", require("telescope.builtin").git_branches, desc = "Branches" },
        -- { "<leader>gcb", require("telescope.builtin").git_bcommits, desc = "Buffer commits" },
        -- { "<leader>gcc", require("telescope.builtin").git_commits, desc = "Git commits" },
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

        -- Trouble
        { "<leader>j", group = "Trouble" },
        { "<leader>jc", "<cmd>Trouble close<cr>", desc = "Close" },
        { "<leader>jd", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>", desc = "Document" },
        { "<leader>jj", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics" },
        { "<leader>jl", "<cmd>Trouble loclist toggle<cr>", desc = "Loclist" },
        { "<leader>jq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix" },
        { "<leader>jr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "References" },
        { "<leader>js", "<cmd>Trouble symbols toggle focus=true<cr>", desc = "Symbols" },

        -- LSP 
        { "<leader>l", group = "LSP" },
        { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
        { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },

        -- Telescope
        { "<leader>s", group = "Telescope" },
        { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Find Command" },
        { "<leader>sj", "<cmd>TodoTelescope<cr>", desc = "Find Todos" },
        { "<leader>sl", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent File" },
        { "<leader>ss", "<cmd>lua require('telescope.builtin').search_history()<cr>", desc = "Find in Search History" },
        { "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Find in Help" },
        { "<leader>sq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", desc = "Find in Quickfix" },
        { "<leader>st", "<cmd>lua require('telescope.builtin').treesitter()<cr>", desc = "Find in Treesitter" },
        { "<leader>sg", "<cmd>lua require('telescope.builtin').git_status()<cr>", desc = "Find in git status" },
        { "<leader>sm", "<cmd>Telescope keymaps<cr>", desc = "Find Keymap" },
        { "<leader>sn", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", desc = "Find Notification" },
        { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Find Register" },
        { "<leader>su", "<cmd>lua require('telescope').extensions.undo.undo()<cr>", desc = "Find in Undo Tree" },
        { "<leader>sy", "<cmd>YAMLTelescope<cr>", desc = "Find in YAML" },
        { "<leader>sz", "<cmd>Telescope colorscheme<cr>", desc = "Find colorscheme" },

        -- Test
        { "<leader>t", group = "Test" },
        { "<leader>ta", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run all test" },
        { "<leader>tg", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show output float" },
        { "<leader>tk", function() require("neotest").run.stop() end, desc = "Stop tests" },
        { "<leader>tr", function() require("neotest").output_panel.toggle() end, desc = "Toggle output" },
        { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle summary" },
        { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run test under cursor" },
        { "<leader>tw", function() require("neotest").watch.toggle() end, desc = "Watch changes" },
    },
}
