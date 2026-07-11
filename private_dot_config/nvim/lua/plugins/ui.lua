return {
    -- outline view
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
        end,
    },
    -- tabline/bufferline
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup({
                highlights = {
                    buffer_selected = {
                        bold = true,
                        italic = false,
                    },
                },
            })
        end,
    },
    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local jj = require("utils.jj")
            local get_color = require("lualine.utils.utils").extract_highlight_colors

            require("lualine").setup({
                winbar = nil,
                inactive_winbar = nil,
                sections = {
                    lualine_b = {
                        { "branch" },
                        {
                            -- minimum jujutsu status
                            function()
                                return jj.status()
                            end,
                            cond = function()
                                return jj.status() ~= ""
                            end,
                        },
                        {
                            "diff",
                            colored = true,
                            diff_color = {
                                added = { fg = get_color("GitSignsAdd", "fg") },
                                modified = { fg = get_color("GitSignsChange", "fg") },
                                removed = { fg = get_color("GitSignsDelete", "fg") },
                            },
                        },
                        {
                            "diagnostics",
                            colored = true,
                            diagnostics_color = {
                                error = { fg = get_color("DiagnosticSignError", "fg") },
                                warn = { fg = get_color("DiagnosticSignWarn", "fg") },
                                info = { fg = get_color("DiagnosticSignInfo", "fg") },
                                hint = { fg = get_color("DiagnosticSignHint", "fg") },
                            },
                            sources = { "nvim_lsp" },
                            symbols = {
                                error = " ",
                                warn = " ",
                                info = " ",
                                hint = " ",
                            },
                        },
                    },
                    lualine_c = {
                        { require("recorder").recordingStatus },
                        "filename",
                    },
                },
            })
        end,
    },
    -- indentation guides
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
    -- highlight colors
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({
                render = "virtual",
                virtual_symbol_position = "eol",
            })
            require("nvim-highlight-colors").turnOff()
        end,
    },
    -- Notifications
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
    -- Explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        -- @module "neo-tree"
        -- @type neotree.Config?
        opts = {
            -- fill any relevant options here
        },
    },
    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        tag = "nerd-v3.2-compat",
    },
    -- LSP/Diag messages view
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end,
    },
    -- winbar
    {
        "Bekaboo/dropbar.nvim",
        config = function()
            require("dropbar").setup({
                bar = {
                    enable = function(buf, win, _)
                        buf = vim._resolve_bufnr(buf)
                        if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_win_is_valid(win) then
                            return false
                        end

                        if
                            not vim.api.nvim_buf_is_valid(buf)
                            or not vim.api.nvim_win_is_valid(win)
                            or vim.fn.win_gettype(win) ~= ""
                            or vim.wo[win].winbar ~= ""
                            or vim.bo[buf].ft == "help"
                        then
                            return false
                        end

                        local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
                        if stat and stat.size > 1024 * 1024 then
                            return false
                        end

                        return vim.bo[buf].bt == "terminal"
                            or vim.bo[buf].ft == "markdown"
                            or pcall(vim.treesitter.get_parser, buf)
                            or not vim.tbl_isempty(vim.lsp.get_clients({
                                bufnr = buf,
                                method = "textDocument/documentSymbol",
                            }))
                    end,
                },
                sources = {
                    path = {
                        relative_to = function(buf, win)
                            -- Show full path in oil or fugitive buffers
                            local bufname = vim.api.nvim_buf_get_name(buf)
                            if vim.startswith(bufname, "oil://") or vim.startswith(bufname, "fugitive://") then
                                local root = bufname:gsub("^%S+://", "", 1)
                                while root and root ~= vim.fs.dirname(root) do
                                    root = vim.fs.dirname(root)
                                end
                                return root
                            end

                            local ok, cwd = pcall(vim.fn.getcwd, win)
                            return ok and cwd or vim.fn.getcwd()
                        end,
                    },
                },
            })
        end,
    },
}
