local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)
vim.g.mapleader = " "

require("10_options")
require("20_filetype")

require("lazy").setup({
    spec = {
        { import = "30_plugins" },
    },
    rocks = {
        enabled = false,
    },
})

require("40_keymaps")
