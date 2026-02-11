return
{
    "folke/trouble.nvim",
    opts = {
        auto_preview = false,         -- 指定不自动预览
        focus = true,                 -- 指定窗口出现时自动聚焦
        win = { position = "right" }, -- 指定窗口出现在右侧
        filter = function(items)
            if (#items > 200) then    -- trouble.nvim default show max_items is 200
                print("Trouble: Over Size! total result num : " .. #items .. ". every filename only show 1 result.")
                local set = {}
                local reduce_items = {}
                for _, it in ipairs(items) do
                    print(unpack(it))
                    if not set[it.filename] then
                        table.insert(reduce_items, it)
                        set[it.filename] = true;
                    end
                end
                return reduce_items;
            else
                return items
            end
        end,
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>td",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tD",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>ts",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>tl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>tl",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>tq",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
}
