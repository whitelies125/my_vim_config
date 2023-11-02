-- 用于显示代码行的 git 提交人信息，提交 git 修改等
return {
    -- 插件在 github 的 URL
    'lewis6991/gitsigns.nvim',
    opts = {
        linehl = true,
        current_line_blame = true,
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = "gitsigns: move to next hunk"})

            map('n', '[c', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = "gitsigns: move to last hunk"})

            -- Actions
            map('n', '<leader>hs', gs.stage_hunk, { desc = "gitsigns: stage the hunk" })
            map('n', '<leader>hr', gs.reset_hunk, { desc = "gitsigns: reset the hunk" })
            map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = "gitsigns: stage the range" })
            map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = "gitsigns: reset the range" })
            map('n', '<leader>hS', gs.stage_buffer, { desc = "gitsigns: stage the buffer" })
            map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "gitsigns: undo last stage" })
            map('n', '<leader>hR', gs.reset_buffer, { desc = "gitsigns: reset the buffer" })
            map('n', '<leader>hp', gs.preview_hunk, { desc = "gitsigns: preview the hunk" })
            map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = "gitsigns: run \"git blame\"" })
            map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "gitsigns: toggle show line git blame info" })
            map('n', '<leader>hd', gs.diffthis, { desc = "gitsigns: show buffer diff" })
            map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "gitsigns: show buffer last commit diff" })
            map('n', '<leader>td', gs.toggle_deleted, { desc = "gitsigns: toggle show deleted line" })

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
    },
    -- 当 lazy.nvim 加载该插件时，将会执行 config.
    -- config 可设置为
    -- true：表示执行 lazy.nvim 提供的默认实现的函数，该默认实现会执行该插件的 setup(opts) 函数
    -- fun(LazyPlugin, opts:table): 执行 config 定义的回调函数
    config = function(_, opts)
        require('gitsigns').setup(opts)
    end
}
