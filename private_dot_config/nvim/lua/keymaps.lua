local conform = require("conform")
local neotest = require("neotest")
local hc = require("nvim-highlight-colors")
local notify = require("mini.notify")

-- normal mode keymaps with <leader>
-- group "toggle"
vim.keymap.set("n", "<leader><space>", "", { desc = "Toggle" })
vim.keymap.set("n", "<leader><space>L", function()
    vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
end, { desc = "CodeLens" })
vim.keymap.set("n", "<leader><space>C", "<cmd>TSContextToggle<cr>", { desc = "TreeSitter context" })
vim.keymap.set("n", "<leader><space>c", hc.toggle, { desc = "Highlight colors" })
vim.keymap.set("n", "<leader><space>e", "<cmd>Neotree toggle<cr>", { desc = "File explorer" })
vim.keymap.set("n", "<leader><space>g", "", { desc = "Toggle/Git" })
vim.keymap.set("n", "<leader><space>gb", "<cmd>Gitsigns toggle_current_line<cr>", { desc = "Current line blame" })
vim.keymap.set("n", "<leader><space>gd", "<cmd>Gitsigns toggle_deleted<cr>", { desc = "Deleted" })
vim.keymap.set("n", "<leader><space>gv", "<cmd>DiffviewToggleFiles<cr>", { desc = "DiffView file tree" })
vim.keymap.set("n", "<leader><space>l", "<cmd>LLToggle!<cr>", { desc = "Loclist" })
vim.keymap.set("n", "<leader><space>o", "<cmd>AerialToggle!<cr>", { desc = "Outline" })
vim.keymap.set("n", "<leader><space>q", "<cmd>QFToggle!<cr>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader><space>t", "<cmd>ToggleTerm<cr>", { desc = "Terminal" })

-- diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic" })

-- group "find"
vim.keymap.set("n", "<leader>f", "", { desc = "Find" })
vim.keymap.set("n", "<leader>fD", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP definitions" })
vim.keymap.set("n", "<leader>fG", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fR", "<cmd>Telescope lsp_references<cr>", { desc = "LSP references" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Git files" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fn", notify.show_history, { desc = "Noice message history" })
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope project<cr>", { desc = "Project" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope ghq<cr>", { desc = "ghq repository" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope aerial<cr>", { desc = "Symbol in this buffer" })

-- group "git"
vim.keymap.set("n", "<leader>g", "", { desc = "Git" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame current line" })
vim.keymap.set("n", "<leader>gd", "", { desc = "Git/diff" })
vim.keymap.set("n", "<leader>gdi", "<cmd>Gitsigns diffthis<cr>", { desc = "View diff from index" })
vim.keymap.set("n", "<leader>gdh", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "View diff from HEAD" })
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
vim.keymap.set("n", "<leader>gh", "", { desc = "Git/hunk" })
vim.keymap.set("n", "<leader>ghR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset hunks in buffer" })
vim.keymap.set("n", "<leader>ghS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage hunks in buffer" })
vim.keymap.set("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo last stage" })
vim.keymap.set("n", "<leader>gv", "", { desc = "Git/DiffView" })
vim.keymap.set("n", "<leader>gv<space>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle DiffView" })
vim.keymap.set("n", "<leader>gvc", "<cmd>DiffviewClose<cr>", { desc = "Close DiffView" })
vim.keymap.set("n", "<leader>gvo", "<cmd>DiffviewOpen<cr>", { desc = "Open DiffView" })
vim.keymap.set("n", "<leader>gvr", "<cmd>DiffviewRefresh<cr>", { desc = "Refresh DiffView" })

-- group "lsp"
vim.keymap.set("n", "<leader>l", "", { desc = "LSP" })
vim.keymap.set("n", "<leader>lD", "<cmd>Telescope lsp_definitions<cr>", { desc = "Find definitions" })
vim.keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
vim.keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Find symbols in workspace" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>ll", vim.lsp.codelens.run, { desc = "Run CodeLens action" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, { desc = "Add all diagnostics to quickfix list" })
vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols in buffer" })

-- group "treesitter"
vim.keymap.set("n", "<leader>s", "", { desc = "TreeSitter" })
vim.keymap.set("n", "<leader>sc", "", { desc = "TreeSitter/context" })
vim.keymap.set("n", "<leader>sc<space>", "<cmd>TSContextToggle<cr>", { desc = "Toggle context" })
vim.keymap.set("n", "<leader>scd", "<cmd>TSContextDisable<cr>", { desc = "Disable context" })
vim.keymap.set("n", "<leader>sce", "<cmd>TSContextEnable<cr>", { desc = "Enable context" })

-- group "test"
vim.keymap.set("n", "<leader>t", "", { desc = "Test" })
vim.keymap.set("n", "<leader>tc", neotest.output_panel.clear, { desc = "Clear test output panel" })
vim.keymap.set("n", "<leader>to", neotest.output_panel.toggle, { desc = "Toggle test output panel" })
vim.keymap.set("n", "<leader>tr", "", { desc = "Run test" })
vim.keymap.set("n", "<leader>trs", function()
    neotest.run.run(vim.fn.getcwd())
end, { desc = "Run suite test" })
vim.keymap.set("n", "<leader>trf", function()
    neotest.run.run(vim.fn.expand("%"))
end, { desc = "Run file test" })
vim.keymap.set("n", "<leader>trl", neotest.run.run_last, { desc = "Run last test" })
vim.keymap.set("n", "<leader>trn", neotest.run.run, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Toggle test summary window" })
vim.keymap.set("n", "<leader>tS", neotest.run.stop, { desc = "Stop test" })

-- group "trouble"
vim.keymap.set("n", "<leader>x", "", { desc = "Trouble" })
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter=buf=0<cr>", { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter=buf=0<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbol toggle focus=false<cr>", { desc = "Symbols" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })
vim.keymap.set(
    "n",
    "<leader>xL",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP defs/refs/..." }
)

-- normal mode keymaps without <leader>
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Display hover info" })
vim.keymap.set("n", "T", neotest.output.open, { desc = "Display output of test" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of the line" })

-- group "goto/comment"
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to decleration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, { desc = "Go to signature help" })

-- group "prev"
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "[c", "<cmd>Gitsign prev_hunk<cr>", { desc = "Prev Git hunk" })
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = false })
end, { desc = "Diagnostic" })
vim.keymap.set("n", "[l", "<cmd>LLPrev<cr>", { desc = "Prev Loclist" })
vim.keymap.set("n", "[q", "<cmd>QFPrev<cr>", { desc = "Prev Quickfix" })
vim.keymap.set("n", "[t", neotest.jump.prev, { desc = "Prev Test" })
-- group "next"
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "]c", "<cmd>Gitsign next_hunk<cr>", { desc = "Next Git hunk" })
vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = false })
end, { desc = "Diagnostic" })
vim.keymap.set("n", "]l", "<cmd>LLNext<cr>", { desc = "Next loclist" })
vim.keymap.set("n", "]q", "<cmd>QFNext<cr>", { desc = "Next quickfix" })
vim.keymap.set("n", "]t", neotest.jump.next, { desc = "Next Test" })

-- with modifier key
vim.keymap.set("n", "<M-f>", function()
    conform.format({
        lsp_fallback = true,
    })
end, { desc = "Format file" })
vim.keymap.set("n", "<M-[>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<M-]>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<C-l>", "<cmd>nohl<cr>", { desc = "Clear highlight" })

-- visual mode mappings with <leader>
vim.keymap.set("v", "<leader>g", "", { desc = "Git" })
vim.keymap.set("v", "<leader>gh", "", { desc = "Git/hunk" })
vim.keymap.set("v", "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
vim.keymap.set("v", "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
