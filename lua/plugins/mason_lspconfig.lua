-- 用于 mason 与 nvim-lspconfig 的中间层
return {
    -- 插件在 github 的 URL
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    -- 开启懒加载, 在触发特定事件 or 执行特定命令 or 打开特定类型文件 or 输入特定按键时才加载该插件
    lazy = true,
    -- lazy == true 时，当打开特定类型文件时，才加载该插件
    ft = { "c", "cpp", "h", "lua" },
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        require("mason-lspconfig").setup {
            -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
            -- This setting has no relation with the `automatic_installation` setting.
            ---@type string[]
            ensure_installed = { "lua_ls", "clangd" },

            -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
            -- This setting has no relation with the `ensure_installed` setting.
            -- Can either be:
            --   - false: Servers are not automatically installed.
            --   - true: All servers set up via lspconfig are automatically installed.
            --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
            --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
            ---@type boolean
            automatic_installation = false,

            -- See `:h mason-lspconfig.setup_handlers()`
            ---@type table<string, fun(server_name: string)>?
            --[[
            handlers = {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                -- Next, you can provide targeted overrides for specific servers.
            },
            --]]
        }
    end,
}
