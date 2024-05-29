-- 使用 nvim-cmp 插件进行补全的相关设置
return {
    -- 插件在 github 的 URL
    "hrsh7th/nvim-cmp",
    -- 依赖插件
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    },
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        -- Set up nvim-cmp.
        local cmp = require 'cmp'

        local nvim_lsp_cfg = {
            name = 'nvim_lsp',
            max_item_count = 10,
        }
        local cmp_buffer_cfg = {
            name = 'buffer',
            max_item_count = 10,
        }
        local cmp_path_cfg = {
            name = 'path',
            max_item_count = 10,
        }
        local cmp_cmdline_cfg = {
            name = 'cmdline',
            max_item_count = 10,
        }

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },
            window = {
                -- 使补全下拉菜单更宽显示
                -- completion = cmp.config.window.bordered(),
                -- 使补全详细信息更宽显示
                -- documentation = cmp.config.window.bordered(),
            },

            formatting = {
                -- 设置补全下拉菜单的显示 complete-items 位置顺序
                fields = { "abbr", "kind", "menu" },
                -- 自定义补全菜单各位置 complete-items 的显示内容
                format = function(entry, vim_item)
                    -- vim_item.kind = string.format("%s", vim_item.kind)
                    local source_mapping = {
                        buffer   = "[buffer]",
                        nvim_lsp = "[lsp]",
                        path     = "[path]",
                    }
                    vim_item.menu = source_mapping[entry.source.name]
                    return vim_item;
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if vim.snippet.active({ direction = 1 }) then
                        local key = "<cmd>lua vim.snippet.jump(1)<CR>"
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "", true)
                    elseif cmp.visible() then
                        cmp.confirm({ select = true })
                    else
                        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function()
                    if vim.snippet.active({ direction = -1 }) then
                        local key = "<cmd>lua vim.snippet.jump(-1)<CR>"
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "", true)
                    elseif cmp.visible() then
                        cmp.confirm({ select = true })
                    end
                end, { "i", "s" }),
            }),

            sources = cmp.config.sources({
                nvim_lsp_cfg,
                cmp_buffer_cfg,
            })
        })

        -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
        -- Set configuration for specific filetype.
        --[[ cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
            { name = 'git' },
            }, {
            { name = 'buffer' },
            })
        })
        require("cmp_git").setup() ]]
        --

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                cmp_buffer_cfg,
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                cmp_path_cfg,
                cmp_cmdline_cfg,
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end
}
