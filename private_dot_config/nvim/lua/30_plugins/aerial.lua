return {
    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("aerial").setup({
                backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
                layout = {
                    max_width = { 20, 0.2 },
                },
                filter_kind = false,
                on_attach = function(bufnr)
                    -- Jump forwards/backwards with '{' and '}'
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
            })
            require("telescope").load_extension("aerial")
        end,
    },
}
