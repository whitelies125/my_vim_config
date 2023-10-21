-- 用于自动补全成对括号、删除成对括号、跳出右括号、成对括号内回车缩进
return {
    -- 插件在 github 的 URL
    "whitelies125/simple_pairs.nvim",
    opts = {
        pairs_config = {
            ['{'] = '}',
            ['('] = ')',
            ['['] = ']',
            ['\''] = '\'',
            ['"'] = '"',
        },
        -- 用于 visual_model 下对选中字符串添加 pair 的 {lhs} 的前缀按键
        -- 若不设置，或设为 nil，false 则表示不使用该功能
        visual_model_trigger_key = "<Space>"
    },
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        local sp = require("simple_pairs")
        sp.setup(opts)

        local keymap_opts = { noremap = true, silent = true }
        local keymap_expr_opts = { noremap = true, silent = true, expr = true}
        vim.keymap.set('i', '<CR>', function() return sp.when_input_enter() end, keymap_expr_opts)
        vim.keymap.set('i', '<BS>', function() return sp.when_input_backspace() end, keymap_expr_opts)
        vim.keymap.set('i', '<C-E>', sp.move_pair_right, keymap_opts)
        vim.keymap.set('i', '<C-Y>', sp.move_pair_left, keymap_opts)
    end,
}
