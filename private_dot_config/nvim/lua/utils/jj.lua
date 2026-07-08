local M = {
    cache = "",
}

function M.status()
    return M.cache
end

function M.update()
    vim.system({
        "jj",
        "log",
        "-r",
        "@",
        "--no-graph",
        "--color",
        "never",
        "--template",
        [[
      separate(" ",
        change_id.shortest(7),
        if(conflict, "💥")
      )
    ]],
    }, { text = true }, function(obj)
        if obj.code ~= 0 then
            M.cache = ""
            return
        end

        M.cache = "🥋 " .. vim.trim(obj.stdout)

        vim.schedule(function()
            vim.cmd.redrawstatus()
        end)
    end)
end

vim.api.nvim_create_autocmd({
    "VimEnter",
    "BufWritePost",
}, {
    callback = M.update,
})

return M
