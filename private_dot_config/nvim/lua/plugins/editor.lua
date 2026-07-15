return {
    -- formatter
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                    css = { "prettier" },
                    fish = { "fish_indent" },
                    go = { "gofumpt", "goimports" },
                    html = { "prettier" },
                    javascript = { "biome" },
                    javascriptreact = { "biome" },
                    json = { "biome" },
                    lua = { "stylua" },
                    markdown = { "prettier" },
                    python = { "ruff_format" },
                    ruby = { "rubyfmt" },
                    rust = { "rustfmt" },
                    sh = { "shfmt" },
                    toml = { "tombi" },
                    typescript = { "biome" },
                    typescriptreact = { "biome" },
                    yaml = { "yamlfmt" },
                    zsh = { "shfmt" },
                    ["_"] = { "trim_whitespace" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    timeout_ms = 1000,
                },
            })
        end,
    },
    -- Find and Replace
    {
        "MagicDuck/grug-far.nvim",
        config = function()
            require("grug-far").setup()
        end,
    },
    -- Surround text objects
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    -- Improve quickfix workflow
    {
        "stevearc/quicker.nvim",
        ft = "qf",
        ---@module "quicker"
        opts = {},
    },
    {
        "kevinhwang91/nvim-bqf",
        config = function()
            require("bqf").setup()
        end,
    },
    -- Improve Recording workflow
    {
        "chrisgrieser/nvim-recorder",
        -- config = function()
        --   require("recorder").setup()
        -- end,
    },
    -- Keybinding hints
    {
        "nvim-mini/mini.clue",
        version = false,
        config = function()
            local miniclue = require("mini.clue")
            miniclue.setup({
                triggers = {
                    -- Leader triggers
                    { mode = { "n", "x" }, keys = "<Leader>" },

                    -- `[` and `]` keys
                    { mode = "n", keys = "[" },
                    { mode = "n", keys = "]" },

                    -- Built-in completion
                    { mode = "i", keys = "<C-x>" },

                    -- `g` key
                    { mode = { "n", "x" }, keys = "g" },

                    -- Marks
                    { mode = { "n", "x" }, keys = "'" },
                    { mode = { "n", "x" }, keys = "`" },

                    -- Registers
                    { mode = { "n", "x" }, keys = '"' },
                    { mode = { "i", "c" }, keys = "<C-r>" },

                    -- Window commands
                    { mode = "n", keys = "<C-w>" },

                    -- `z` key
                    { mode = { "n", "x" }, keys = "z" },
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.square_brackets(),
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                },
                window = {
                    config = {
                        width = 50,
                    },
                    delay = 200,
                },
            })
        end,
    },
}
