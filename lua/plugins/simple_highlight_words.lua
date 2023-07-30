-- 用于高亮多个 word
return {
    -- 插件在 github 的 URL
    "whitelies125/simple_highlight_words.nvim",
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        require("simple_highlight_words").setup()
    end,
}
