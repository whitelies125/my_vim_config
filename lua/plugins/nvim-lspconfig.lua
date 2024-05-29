-- nvim 的 LSP(Language Service Protocol) 相关设置
return {
    -- 插件在 github 的 URL
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        -- 用于给 lsp 传递配置，使其配合 nvim-cmp 插件
        'hrsh7th/cmp-nvim-lsp',
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
        -- Setup language servers.
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- 启动 clangd
        local c_cpp_ft = { 'c', 'cpp', 'h' }
        for i = 1, #c_cpp_ft do
            if c_cpp_ft[i] == vim.bo.filetype then
                lspconfig.clangd.setup {
                    capabilities = capabilities
                }
                break
            end
        end
        if vim.bo.filetype == 'lua' then
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        },
                        capabilities = capabilities
                    },
                },
            }
        end
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        local map_opts = function(str)
            return { noremap = true, silent = true, desc = str }
        end
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, map_opts("lspconfig: show diagnostics"))
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, map_opts("lspconfig: goto previous diagnostic"))
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, map_opts("lspconfig: goto next diagnostic"))
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, map_opts("lspconfig: show buff diagnostics"))

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                -- local opts = { buffer = ev.buf }
                local map_opts_buf = function(str)
                    return { buffer = ev.buf, noremap = true, silent = true, desc = str }
                end
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, map_opts_buf("lsp goto declaretion"))
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, map_opts_buf("lsp: goto definition"))
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, map_opts_buf("lsp: show hover info"))
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, map_opts_buf("lsp: list all inplementations"))
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, map_opts_buf("lsp: show signature info"))
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, map_opts_buf("lsp: add workspace folder"))
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, map_opts_buf("lsp: remove workspace folder"))
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, map_opts_buf("lsp: list workspace folders"))
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, map_opts_buf("lsp: goto type definition"))
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, map_opts_buf("lsp: rename"))
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, map_opts_buf("lsp: list code actions"))
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, map_opts_buf("lsp: list all references"))
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, map_opts_buf("lsp: format the buffer"))
            end,
        })
    end
}
