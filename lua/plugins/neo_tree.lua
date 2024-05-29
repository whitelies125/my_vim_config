-- 用于文件树，查看目录等
return {
    "nvim-neo-tree/neo-tree.nvim",
    -- 指定仓库的分支
    branch = "v3.x",
    -- 当加载该插件时，dependencies 总是在其之前前完成加载
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        default_component_configs = {
            git_status = {
                symbols = {
                    -- Change type
                    added     = "add",
                    deleted   = "del",
                    modified  = "mod",
                    renamed   = "rename",
                    -- Status type
                    untracked = "untracked",
                    ignored   = "ignored",
                    unstaged  = "unstaged",
                    staged    = "staged",
                    conflict  = "conflict",
                },
            },
        },
        window = {
            mappings = {
                -- ["S"] = "split_with_window_picker",
                -- ["s"] = "vsplit_with_window_picker",
                ["zo"] = "open",
                ["z"] = "",
                ["zc"] = "close_node",
                ["zM"] = "close_all_nodes",
                --["Z"] = "expand_all_nodes",
            },
        },
        filesystem = {
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false, -- only works on Windows for hidden files/directories
            },
        },
    },
    config = function(_, opts)
        require('neo-tree').setup(opts)
        local map_opts = function(str)
            return { noremap = true, silent = true, desc = str }
        end
        -- key=value写法: ':Neotree action=focus source=filesystem position=left toggle=true reveal=true<CR>'
        -- Neotree 支持乱序
        vim.keymap.set('n', '<leader>nt', ':Neotree filesystem focus left toggle reveal<CR>',
            map_opts("neotree: directory tree"))
        vim.keymap.set('n', '<leader>ng', ':Neotree git_status focus left toggle reveal<CR>',
            map_opts("neotree: git_status tree"))
    end
}
