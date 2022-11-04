" 设置不兼容 vi，而是使用 vim 的功能
" 兼容 vi 使用起来比较奇怪（毕竟 vi 更老，功能相比 vim 更少）
" 兼容 vi 会使得许多 vim 的功能无法生效和使用
set nocompatible

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

" 设置使用剪贴板寄存器（系统剪贴板） "* 进行所有的抽出、删除、修改、放置操作
" 不设置时，默认使用的是无名寄存器 ""
set clipboard=unnamed

" 设置自动切换工作目录
" 当 vim 打开多个文件时，若开启，会自动将工作目录切换到当前编辑文件所在目录；
" 若关闭，则不会自动切换
set autochdir

" 设置终端使用颜色为 256 色
set t_Co=256 

"" 语法高亮相关配置 {
" 开启语法高亮
syntax enable
" 设置 molokai 的选项
let g:molokai_original = 1
let g:rehash256 = 1
" 设置高亮主题为 molokai。主题路径于 vimfiles/colors/ 
colorscheme molokai

" 设置 C 风格函数高亮
syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cParen,cCppParen
hi def link cUserFunction Function

" 设置光标所在当前行显示为高亮
set cursorline
" 设置光标所在当前列显示为高亮
set cursorcolumn
" 设置对搜索结果高亮
" set hlsearch
" 设置当按 n/N 向下/上跳转搜索结果是，提示已是最下/上方的搜索结果
set ruler
" }

" 设置搜索时，随着输入即可进行同步搜索，并仅在同步搜索过程中高亮搜索结果
" 即在按下"/"和"回车"的中间过程中，每次修改待搜索字符串都会进行一次搜索并高亮搜索结果，
" 但如果不开启 hlsearch，则按下 "回车" 后无高亮显示，incsearch 的高亮作用于同步搜索过程中
" 若不设置，则是在按下回车后进行搜索
set incsearch
" 设置搜索时忽略大小写进行匹配
set ignorecase
" 设置如果搜索的字符串中包含大写字母，则不适用 ignorecase 即不忽略大小写
" 该设置尽在搜索模式且已开启 ignorecase 选项时才生效
set smartcase

" 设置以当前行显示为绝对行号，其它行显示为相对行号
set number relativenumber

" 设置显示 tab 键时对应的 space 数，注意仅仅只是修改了显示 tab 键时的长度，而并不是将 tab 键转换为 4 个 space
set tabstop=4
" 设置输入 tab 键时，将其转换为 space
" 这个设置才是输入时的 tab 向 space 的转换
set expandtab

" 设置 backspace 键对一些情况的处理
" indent  允许在自动缩进上退格
" eol     允许在换行符上退格（连接行）
" start   允许在插入开始的地方上退格；CTRL-W 和 CRTL-U 达到插入开始的位置时停留一次。
" nostop  类似于 start，但 CTRL-W 和 CTRL-U 不在插入开始的位置停留
" 解释：
" indent  设置后，backspace 在插入模式下可删除自动缩进填充的空格；若不设置则无法删除
" eol     设置后，backspace 在插入模式下可删除换行符，即可删除至上一行，即合并该行与上一行为同一行；若不设置则不可删除
" start/nostop 二选一
" 设置后，backspace 在插入模式下可删除插入开始位置之前的字符；
" 二者区别在于，当 CTRL-W，CTRL-U 进行的删除操作会删除至插入开始位置之前时，start只会删除至插入开始位置，需要再按一次才能删除至开始位置之前；而 nostop 则是不考虑这一点。
set backspace=indent,eol,nostop

"" 按键映射相关配置
" 插入模式映射
imap jj <Esc>

