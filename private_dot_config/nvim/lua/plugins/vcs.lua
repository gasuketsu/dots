return {
    -- VCSigns
    {
        "algmyr/vcsigns.nvim",
        dependencies = {
            "algmyr/vclib.nvim",
            "lewis6991/async.nvim",
        },
        config = function()
            require("vcsigns").setup({
                target_commit = 1,
            })
        end,
    },
    -- jj.nvim
    {
        "nicolasgb/jj.nvim",
        version = "*",
        config = function()
            require("jj").setup({
                diff = {
                    backend = "codediff",
                },
            })
        end,
    },
    -- LazyGit
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
    -- codediff
    {
        "esmuellert/codediff.nvim",
        cmd = "CodeDiff",
    },
    -- diff view
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("diffview").setup()
        end,
    },
}
