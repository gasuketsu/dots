return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "▏",
                    tab_char = "›",
                },
                scope = {
                    enabled = true,
                },
            })
        end,
    },
}
