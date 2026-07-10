return {
    -- Change working directory to project root
    {
        "wsdjeg/rooter.nvim",
        config = function()
            require("rooter").setup({
                root_patterns = { ".git/", ".jj/", ".hg/" },
            })
        end,
    },
}
