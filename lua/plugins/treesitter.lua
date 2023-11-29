return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "HiPhish/nvim-ts-rainbow2" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "cpp", "python", "lua", "yaml", "bash", "go", "gosum", "gomod", "gowork", "vim", "vimdoc", "query",
                "c", "json", "typescript", "jq", "rego", "toml", "html", "gitignore", "git_config", "git_rebase",
                "gitcommit", "java", "javascript", "jsonnet", "make", "markdown", "markdown_inline", "terraform",
                "hcl", "http", "regex", "promql", "passwd"
            },
            sync_install = false,
            auto_install = true,
            ignore_install = { "" }, -- List of parsers to ignore installing
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "" }, -- list of language that will be disabled
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = true },
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
