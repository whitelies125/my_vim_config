-- 用于 mason 与 nvim-lspconfig 的中间层
return {
    -- 插件在 github 的 URL
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        -- 用于给 lsp 传递配置，使其配合 nvim-cmp 插件
        'hrsh7th/cmp-nvim-lsp',
    },
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        vim.lsp.config('*', {
            capabilities = capabilities,
        });
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = {
                            'vim',
                        },
                    },
                },
            },
        })
        vim.lsp.config('clangd', {
            init_options = {
                -- fallbackFlags 只用于找不到文件对应编译命令时使用
                -- 例如没有 compile_command.json 的单文件 or 项目
                -- 如果找到文件对应的编译命令，例如在 compile_command.json 中找到了，
                -- 那么这个 fallbackFlags 是没有作用的
                -- 参考：
                -- https://clangd.llvm.org/extensions
                -- https://clang.llvm.org/extra/doxygen/Protocol_8h_source.html
                fallbackFlags = {
                    '-std=c++23',
                    '--target=x86_64-w64-windows-gnu',
                }
            },
        })
        require("mason-lspconfig").setup {
            -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
            ---@type string[]
            ensure_installed = { "lua_ls", "clangd", "pyright" },

            -- Whether installed servers should automatically be enabled via `:h vim.lsp.enable()`.
            --
            -- To exclude certain servers from being automatically enabled:
            -- ```lua
            --   automatic_enable = {
            --     exclude = { "rust_analyzer", "ts_ls" }
            --   }
            -- ```
            --
            -- To only enable certain servers to be automatically enabled:
            -- ```lua
            --   automatic_enable = {
            --     "lua_ls",
            --     "vimls"
            --   }
            -- ```
            ---@type boolean | string[] | { exclude: string[] }
            automatic_enable = true,
        }
    end,
}
