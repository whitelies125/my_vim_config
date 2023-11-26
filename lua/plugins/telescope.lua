-- 用于搜索文件等
return {
    -- 插件在 github 的 URL
    'nvim-telescope/telescope.nvim',
    -- 该插件的 git tag 值
    tag = '0.1.4',
    -- 该插件的依赖，当该插件被加载时，dependencies 中的插件应该已加载完成
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        local builtin = require('telescope.builtin')
        local map_opts = { noremap = true, silent = true }
        local map_opts = function(str)
            return { noremap = true, silent = true, desc = str }
        end
        vim.keymap.set('n', '<leader>ff', builtin.find_files, map_opts("telescope: find files"))
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, map_opts("telescope: live grep"))
        vim.keymap.set('n', '<leader>fb', builtin.buffers, map_opts("telescope: buffers"))
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, map_opts("telescope: help tags"))
    end
}
