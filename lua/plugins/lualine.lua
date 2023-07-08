-- 用于底部状态栏 status line
return {
    -- 插件在 github 的 URL
    'nvim-lualine/lualine.nvim',
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        require('lualine').setup {
            options = {
                theme = 'catppuccin',
            }
        }
    end
}
