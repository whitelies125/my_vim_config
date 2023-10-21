-- 用于添加注释 or 取消注释
return {
    -- 插件在 github 的 URL
    "whitelies125/simple_comment.nvim",
    -- 传递给 config = function(_, opts) 的 opts
    opts = {
            filetype_format_config = {
                c   = {single = "//", block = {head = "/*", tail = "*/"}},
                cpp = {single = "//", block = {head = "/*", tail = "*/"}},
                lua = {single = "--", block = {head = "--[[", tail = "--]]"}},
                python = {single = "#"},
            }
    },
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        local sc = require("simple_comment")
        sc.setup(opts)
        --  由于一些原因，在 vim/neovim 中是使用的 <C-_> 表示 CTRL-/，而非 <C-/>
        vim.keymap.set({"n"}, "<C-_>", ":lua require(\"simple_comment\").comment(\"n\")<CR>", {noremap = true, silent = true})
        vim.keymap.set({"v"}, "<C-_>", ":lua require(\"simple_comment\").comment(\"v\")<CR>", {noremap = true, silent = true})
    end,
}
