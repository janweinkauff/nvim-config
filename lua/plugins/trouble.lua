return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { use_diagnostic_signs = true },
    config = function()
        require("trouble").setup()
        vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
    end,
}
