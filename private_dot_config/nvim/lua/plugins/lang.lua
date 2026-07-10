return {
    -- d2
    {
        "terrastruct/d2-vim",
        ft = { "d2" },
    },
    -- golang
    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gopher").setup()
        end,
    },
}
