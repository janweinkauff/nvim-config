return {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    config = function()
        require("rose-pine").setup({ variant = 'moon' })
        vim.cmd.colorscheme "rose-pine"
    end
}

--return {
--    'folke/tokyonight.nvim',
--    lazy = false,
--    priority = 1000,
--    config = function()
--        require("tokyonight").setup({ style = 'night' })
--        vim.cmd.colorscheme "tokyonight"
--    end,
--}
