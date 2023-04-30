" 设置不兼容 vi，而是使用 vim 的功能
" 兼容 vi 使用起来比较奇怪（毕竟 vi 更老，功能相比 vim 更少）
" 兼容 vi 会使得许多 vim 的功能无法生效和使用
set nocompatible

" vim-plug begin()里可以指定插件保存目录，不指定'文件夹位置'的话，则默认使用为
" - Vim (Linux/macOS): '~/.vim/plugged'
" - Vim (Windows): '~/vimfiles/plugged'
call plug#begin()
" vim 帮助文档中文
Plug 'yianwillis/vimcdoc'
" 用于 :colorscheme 的 solarized 配色方案
Plug 'altercation/vim-colors-solarized'
" airline 插件
Plug 'vim-airline/vim-airline'
" airline 插件的一堆配色方案
Plug 'vim-airline/vim-airline-themes'
" 用于在 vim 的 singcolum 显示 git diff 修改状态,  预览窗口显示对比前后修改, 在 hunks 之间跳转，以及配合 airline 显示总修改状态
Plug 'airblade/vim-gitgutter'
" 用于通过 :Git xxx 使用 git xxx 命令，以及配合 airline 显示当前所在分支
Plug 'tpope/vim-fugitive'
" LSP(Language Server Protocol) 的 Language Client
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
" C/C++ 基于正则表达式和关键字的高亮
Plug 'bfrg/vim-cpp-modern'
call plug#end()

""" vimcdoc 相关设置
" {
" 设置 :help 命令搜索帮助文件时的语言优先顺序
set helplang=cn,en
" }
""" }

""" 配色方案相关配置 及 solarized 配色方案题相关配置
" {
" 设置终端使用颜色为 256 色
set t_Co=256
" 开启语法高亮，该配置应该在 colorscheme 之前
syntax enable
" 设置背景为亮色，一些 colorscheme 会根据该值进行调整，该配置应该在 colorscheme 之前
set background=light
" 使用 256 色的配色方案
let g:solarized_termcolors=256
" 设置主题为 solarized
colorscheme solarized
" }
""" }

""" vim-airline 相关设置
" {
" 设置 vim-airline 主题
let g:airline_theme = 'solarized'
" 设置使用 powerline 字体（需自己下载安装 powerline 字体)
let g:airline_powerline_fonts = 1
" 启用 tabline
let g:airline#extensions#tabline#enabled = 1
" 设置 tabline 为默认显示配置
let g:airline#extensions#tabline#formatter = 'default'

" 开启 ariline 显示当前所在的 git branch, 需安装其它插件配合 如 fugitive
let g:airline#extensions#branch#enabled = 1
" 开启 ariline 显示 hunks 总的修改状态，需安装其它插件配合 如 gitgutter
let g:airline#extensions#hunks#enabled = 1
" 开启 ariline 显示 LanguageClient 提示信息，需安装 LanguageClient-neovim
let g:airline#extensions#languageclient#enabled = 1
" }
""" }

""" vim-gitgutter 相关设置
" {
" 设置高亮显示有修改的行
let g:gitgutter_highlight_lines = 1
" 设置高亮显示有修改的行的行号
" 翻文档发现 NOTE: This feature requires Neovim 0.3.2 or higher.
" 那就先关着，哪天转 neovim 了再开
let g:gitgutter_highlight_linenrs = 0

" 设置不使用浮动窗口(floating windows/popup-window)查看对比，虽然默认就是0罢
let g:gitgutter_preview_win_floating = 0
" }
""" }

""" LanguageClient-neovim 相关设置, LanguageServer 需要另外安装
" {
"  如果需要使用 clangd 的全局修改变量名的话，设置 set hidden,
"  否则，在默认不设置的情况下会在未写入前关闭窗口会被 vim 阻止
set hidden
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd'],
    \ }
" }
" 设置为 LanguageServer 载入配置文件，其实默认就是 1
let g:LanguageClient_loadSettings = 1
" server 配置文件的位置, 然后还需要在这个 settings.json 文件里写一些配置
let g:LanguageClient_settingsPath = '~/.vim/settings.json'

" 查看变量定义
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" 跳转到定义，直接就使用 gd 映射啦, vim 原生 gd 一般（不太好用），毕竟大多数场景我都是需要跳转到定义的
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" 全局重命名
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" }
""" }

""" vim-cpp-modern 相关设置
" {
" 开启函数名高亮(affects both C and C++ files)
let g:cpp_function_highlight = 1
" 开启对 C++ 11 attributes 的高亮
let g:cpp_attributes_highlight = 1
" 开启 结构体/类 成员变量高亮(affects both C and C++ files)
let g:cpp_member_highlight = 1
" 开启将所有 C/C++ 标准关键字为 Statement 高亮(affects both C and C++ files)
let g:cpp_simple_highlight = 1
" }
""" }

" 设置不创建备份文件。
" 若开启，则 vim 编辑文件 file.cpp 时，会自动先创建一份该文件的备份文件 file.cpp~
set nobackup
" 设置不保留撤销历史。
" 若开启，则 vim 编辑文件 file.cpp 时，会自动创建该文件的 .file.cpp.un~ 文件.
" 用于即便你关闭了 file.cpp，下次打开 file.cpp 时，仍然可以进行撤销操作，即撤销上次打开文件进行的编辑操作。
set noundofile
" 设置不创建交换文件。
" 使用 vim 编辑文件 file.cpp 时，会产生临时文件 .file.cpp.swp。其中在硬盘中临时保存正在编辑的文件。
" 如果正常退出编辑、退出 vim，该文件会被删除；如果异常退出，如系统崩溃、直接关闭终端、电脑断电等，则可通过改交换文件恢复至异常退出（最近一次临时保存）时的状态。
set noswapfile

" 设置也使用无名寄存器 "" 进行所有的抽出、删除、修改、放置操作
" 不设置时，默认的是只使用剪贴板寄存器（系统剪贴板） "*
set clipboard=unnamed

" 设置自动将工作目录切换到当前编辑文件所在目录
" set autochdir

" 设置不自动折行
" 设置后，当一行的字符过长时，会超出 vim 界面最右侧时，而不是在下一行显示
set nowrap

" 设置在屏幕最后一行显示输入的命令(按键)
set showcmd

" 设置以当前行显示为绝对行号，其它行显示为相对行号
set number relativenumber

" 设置显示光标坐标（的行号,列号），如果还有空间，在最右端显示文本在该文件中的相对位置
set ruler
" 设置光标所在当前行显示为高亮
set cursorline
" 设置光标所在当前列显示为高亮
set cursorcolumn
" 设置第 81 列高亮
set colorcolumn=81
" }

" 设置对搜索结果高亮
" 可通过输入 :noh 或 :nohlsearch 临时一次关闭当前高亮结果，或者搜索一个文档中不存在的词，比如搜索乱按的一串字符 /aklsdfjaldf
set hlsearch
" 设置搜索时，随着每次字符的输入/删除，每次都会进行搜索
" 若不设置，则仅是在按下回车后进行搜索
set incsearch
" 设置搜索时忽略大小写进行匹配
set ignorecase
" 设置如果搜索的字符串中包含大写字母，则不适用 ignorecase，即不再忽略大小写
" 该设置仅在搜索模式且已开启 ignorecase 选项时才生效
set smartcase

" 设置显示 tab 键时对应的 space 数，注意仅仅只是修改了显示 tab 键时的长度，而并不是将 tab 键转换为 4 个 space
set tabstop=4
" 设置输入 tab 键时，将其转换为 space
" 这个设置才是输入时进行的 tab 向 space 的转换
set expandtab
" 设置缩进使用的空白数目，shiftwidth=0 表示使用与 tabstop 相同的数值
set shiftwidth=0
" 设置缩进总是取整到 shiftwidth 的整数倍
set shiftround
" 设置 C 风格的自动缩进
set cindent

" 设置关键字补全(ctrl-n)的搜索范围
set complete=.,w,b
" 设置关键字补全列表选项
set completeopt=menu,menuone,preview,

" 设置 <Leader> 为空格键，若不设置默认为反斜杠\
let mapleader=" "

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
inoremap jj <Esc>
inoremap u32 uint32_t
inoremap u16 uint16_t
inoremap u8 uint8_t

" 删除行尾空格
nnoremap rmsp :%s/ *$//g<Enter>:nohl<Enter>

