-- 使用 lazy.nvim 作为插件管理器
-- 检查 lazy.nvim 是否已存在，若不存在则 git clone
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
-- 将 lazy.nvim 的路径加入 runtimepath
vim.opt.rtp:prepend(lazypath)

-- 插件管理
require("lazy").setup({
    require("plugins.catppuccin"),
    require("plugins.lualine"),
    require("plugins.tidy"),
    require("plugins.nvim-lspconfig"),
    require("plugins.telescope"),
    require("plugins.gitsigns"),
})
