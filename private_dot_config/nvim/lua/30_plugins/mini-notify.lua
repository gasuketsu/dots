return {
    {
        "nvim-mini/mini.notify",
        version = false,
        config = function()
            require("mini.notify").setup({
                window = {
                    config = {
                        width = 80,
                    },
                    max_width_share = 0.5,
                },
            })
        end,
    },
}
