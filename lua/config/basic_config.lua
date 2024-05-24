-- 一些与 nvim 本身相关的、比较基础的选项设置

-- vim 中的选项，在 lua 中是 vim.o(类型为 table) 中的变量

-- 对 "" 无名寄存器进行操作时，也对 "+ 寄存器进行同样的操作(unnamed 是对 "*)
vim.o.clipboard = 'unnamedplus'
-- 设置不自动折行
vim.o.wrap = false

-- 设置在终端中使用 24 位彩色
vim.o.termguicolors = true
-- 设置当前行显示为绝对行号，其它行显示为相对行号
vim.o.number = true
vim.o.relativenumber = true
-- 设置显示光标坐标（的行号,列号），如果还有空间，在最右端显示文本在该文件中的相对位置
vim.o.ruler = true
-- 设置光标所在当前行显示为高亮
vim.o.cursorline = true
-- 设置光标所在当前列显示为高亮
-- vim.o.cursorcolumn = true
-- 设置第 81 列高亮
vim.o.colorcolumn = '81'

-- 设置搜索时忽略大小写进行匹配
vim.o.ignorecase = true
-- 设置如果搜索的字符串中包含大写字母，则不适用 ignorecase，即不再忽略大小写
-- 该设置仅在开启 ignorecase 选项，且正在输入搜索字符串时且才生效
vim.o.smartcase = true

-- 设置显示 tab 键时对应的 space 数，注意仅仅只是修改了 tab 键显示长度，而并非是将 tab 键转换为 4 个 space
vim.o.tabstop = 4
-- 设置在插入模式中，插入 tab 时将其转换为合适数量的 space，这个选项才是转换 tab 为 space
vim.o.expandtab = true
-- 设置(自动)缩进使用的空白数目，例如作用于使用 <<，>> 命令时。shiftwidth=0 表示使用与 tabstop 相同的数值
vim.o.shiftwidth = 0
-- 设置缩进总是取整到 shiftwidth 的整数倍
vim.o.shiftround = true
-- 设置智能自动缩进，在换行时自动缩进
vim.o.smartindent = true
-- 设置开启部分字符的显示方式
vim.o.list = true
-- 设置部分字符显示的样式
 vim.o.listchars = "tab:→ ,trail:·,eol:↵"

-- 设置光标靠近屏幕顶端/底部时，保持光标与屏幕顶端/底部有 n 行
vim.o.scrolloff = 4

-- 设置补全列表选项
vim.o.completeopt = 'menuone,popup'
