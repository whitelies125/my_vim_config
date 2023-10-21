-- 用于高亮多个 word
return {
    -- 插件在 github 的 URL
    "whitelies125/simple_highlight_words.nvim",
    -- 传递给 config = function(_, opts) 的 opts
    opts = { colors = { "#8CCBEA", "#A4E57E", "#FFDB72", "#FF7272",
                        "#FFB3FF", "#9999FF", "#FA9425", "#C49791" }
    },
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        local hl = require("simple_highlight_words")
        hl.setup(opts)
        local map_opt = { noremap = true, silent = true }
        vim.keymap.set('n', '<leader>hl', hl.highlight_word, map_opt)
        vim.keymap.set('n', '<leader>nohl', hl.highlight_clear, map_opt)
        vim.keymap.set('v', '<leader>hl', ":lua highlight_string()<CR>", map_opt)
    end,
}
