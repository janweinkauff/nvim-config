return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "leoluz/nvim-dap-go",
        "Weissle/persistent-breakpoints.nvim",
    },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")
        local dapgo = require("dap-go")

        -- Setup the go debug adapter
        dapgo.setup()

        -- Setup DAP virtual text
        require("nvim-dap-virtual-text").setup({})
        vim.g.dap_virtual_text = true

        -- Allows breakpoints to last between sessions
        require("persistent-breakpoints").setup({
            load_breakpoints_event = { "BufReadPost" },
        })

        -- Setup DAP UI
        ui.setup()

        -- Automatically open the DAP UI when the debugging session begins
        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end

        -- Icons
        vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "⁉️ ", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapLogPoint", { text = "📣", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })

        -- Keymap
        vim.keymap.set("n", "<F1>", dap.continue)
        vim.keymap.set("n", "<F2>", dap.step_over)
        vim.keymap.set("n", "<F3>", dap.step_into)
        vim.keymap.set("n", "<F4>", dap.step_out)
        vim.keymap.set("n", "<F5>", dap.close)
    end,
}
