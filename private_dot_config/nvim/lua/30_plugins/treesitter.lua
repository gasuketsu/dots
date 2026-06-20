return {
    {
        "romus204/tree-sitter-manager.nvim",
        dependencies = {
            { "windwp/nvim-ts-autotag" },
            { "JoosepAlviste/nvim-ts-context-commentstring" },
            { "nvim-treesitter/nvim-treesitter-context" },
        },
        config = function()
            require("tree-sitter-manager").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "cmake",
                    "comment",
                    "cpp",
                    "css",
                    "dockerfile",
                    "fish",
                    "go",
                    "gomod",
                    "groovy",
                    "hjson",
                    "html",
                    "java",
                    "javascript",
                    "json",
                    "kotlin",
                    "lua",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "meson",
                    "proto",
                    "python",
                    "regex",
                    "rust",
                    "scss",
                    "svelte",
                    "toml",
                    "tsx",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "yaml",
                    "zsh",
                },
            })
            require("treesitter-context").setup()
            require("nvim-ts-autotag").setup()
            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })
        end,
    },
}
