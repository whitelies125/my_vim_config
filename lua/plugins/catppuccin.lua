-- 用于 colorschem 配色主题
return {
    -- 插件在 github 的 URL
    "catppuccin/nvim",
    -- 设置该插件在 lazy.nvim 管理的 lazy 目录下的文件夹名，不设置则默认为 URL 最后一个 '/' 后的名字
    name = "catppuccin",
    -- 加载优先级，仅对于 lazy = false 的插件生效，即仅对启动 nvim 时便加载的插件生效
    -- 设置其优先级，使得优先加载该插件
    -- 建议将 colorscheme 优先级设置得高一些
    priority = 1000,
    -- 加载插件时，opts 将会传递给 config
    opts = {
        flavour = "latte",
    },
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end
}
