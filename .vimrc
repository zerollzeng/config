let mapleader = ','
let g:mapleader = ','
" 高亮
syntax on
" 设置 256 色
let t_Co=256
" 历史行数
set history=2000
" 文件类型识别
filetype on
" 开启插件
filetype plugin on
" 开启 indent 缩进
filetype indent on

" The maximum line length to warn about, in characters.
let linelengthlimit = 120

" The filetypes to add line length warnings to.
let filemask = "*.c *.cc *.cpp *.h *.py"

let long_line_warning = 1

if long_line_warning
    execute "autocmd BufWinEnter " .
\           filemask .
\           " let w:m2=matchadd('Search', '\\%>" .
\           linelengthlimit .
\           "v.\\+', -1)"
endif


" 基础设置
set nobackup                           " 关闭备份
set nowb
set noswapfile

set nocompatible                       " 禁止 vi 模式
set backspace=indent,eol,start         " 设置 <Backspace>
set autoread                           " 文件在Vim之外修改过，自动重新读入

" 关闭错误提示
set novisualbell                       " 关闭闪烁提示
set noerrorbells                       " 关闭声音提示
set t_vb=
set tm=500


" 高亮
set cursorline                         " 高亮当前行
hi CursorLine term=bold cterm=bold

" 剩余 7 行时翻页
set scrolloff=15

" 显示
set number                             " 显示行号
set numberwidth=6                      " 设置行号列宽度
highlight LineNr ctermfg=grey
set showcmd                            " 在状态栏显示正在输入的命令
set list
set listchars=tab:>-                     " 显示tab

" 搜索
set hlsearch                           " 高亮匹配
set incsearch                          " 开启即时搜索
set ignorecase                         " 搜索时忽略大小写
set smartcase                          " 字符串有大写字母时大小写敏感

" Don't redraw while executing macros (good performance config)
set lazyredraw

" 缩进
set expandtab                          " 使用空格缩进
set smartindent                        " 智能缩进
set autoindent                         " 继承缩进
set shiftround                         " 缩进宽度对齐到 shiftwidth 的整数倍
set tabstop=4                          " <Tab> 宽度
set softtabstop=4                      " 编辑模式下 <Tab> 宽度
set shiftwidth=4                       " 自动缩进宽度
set smarttab                           " 插入 <Tab> 时使用 'shiftwidth'

" Show matching brackets when text indicator is over them
set showmatch

" 状态栏
set laststatus=0                       " disable status bar
" 文件格式
set fileformat=unix

" 新文件编码
set nobomb " 禁止UTF-8 BOM
set encoding=utf-8
set termencoding=utf-8

" 自动识别文件编码
set fileformats=unix,dos,mac
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 禁用 Ex 模式
nmap Q <Nop>
" 切换tab
nmap <F1> gt
" 行号
nmap <F2> :set nu! nu?<CR>
imap <F2> <ESC>:set nu! nu?<CR>a
" 换行符
nmap <F3> :set list! list?<CR>
" 自动换行
nmap <F4> :set wrap! wrap?<CR>
" 粘贴模式
set pastetoggle=<F5>

nmap <F6> :call TogglePair()<CR>
imap <F6> <ESC>:call TogglePair()<CR>a                                                                                                                                               
let is_pair = 0
function! TogglePair()
    let g:is_pair = !g:is_pair
    if g:is_pair == 1
        inoremap ( ()<LEFT>
        inoremap [ []<LEFT>
        inoremap { {}<LEFT>
        inoremap " ""<LEFT>
        inoremap ' ''<LEFT>
        inoremap < <><LEFT>
    else
        iunmap (
        iunmap [
        iunmap {
        iunmap "
        iunmap '
        iunmap <
    endif
endfun

