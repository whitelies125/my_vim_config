
" 设置不创建备份文件。
" 若开启，则 vim 编辑文件 file.cpp 时，会自动先创建一份该文件的备份文件 file.cpp~，即创建一份与原文件 file.cpp 内容一摸一样的备份文件 file.cpp~，然后我们编辑的是 file.cpp 文件
set nobackup
" 设置不保留撤销历史。
" 若开启，则 vim 编辑文件 file.cpp 时，会自动创建该文件的 .file.cpp.un~ 文件.
" 用于即便你关闭了 file.cpp，下次打开 file.cpp 时，仍然可以进行撤销操作，即撤销上次打开文件进行的编辑操作。
set noundofile
" 设置不创建交换文件。
" 使用 vim 编辑文件 file.cpp 时，会产生临时文件 .file.cpp.swp。其中在硬盘中临时保存正在编辑的文件。
" 如果正常退出编辑、退出 vim，该文件会被删除；如果异常退出，如系统崩溃、直接关闭终端、电脑断电等，则可通过改交换文件恢复至异常退出（最近一次临时保存）时的状态。
set noswapfile

" 设置使用系统粘贴板
set clipboard=unnamed

" 设置自动切换工作目录
" 当 vim 打开多个文件时，若开启，会自动将工作目录切换到当前编辑文件所在目录；
" 若关闭，则不会自动切换
set autochdir

"" 语法高亮相关配置 {
" 开启语法高亮
syntax enable
" 设置 molokai 的选项
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256 
" 设置高亮主题为 molokai。主题路径于 vimfiles/colors/ 
colorscheme molokai

" 设置 C 风格函数高亮
syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cParen,cCppParen
hi def link cUserFunction Function
" }

" 设置以当前行显示为绝对行号，其它行显示为相对行号
set number relativenumber

" 设置显示 tab 键时对应的 space 数，注意仅仅只是修改了显示 tab 键时的长度，而并不是将 tab 键转换为 4 个 space
set tabstop=4
" 设置输入 tab 键时，将其转换为 space
" 这个设置才是输入时的 tab 向 space 的转换
set expandtab

" 设置光标当前所在行显示为高亮
" set cursorline

" 设置搜索时忽略大小写进行匹配
set ignorecase


"" 按键映射相关配置
" 插入模式映射
imap jj <Esc>

