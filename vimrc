syntax enable
syntax on " 语法高亮

let mapleader = " "

" 配置自动生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

map S :w<CR>
map Q :q<CR>
" map R :source $MYVIMRC<CR>
map ; :
map <LEADER>sc :set spell!<CR> " 拼写检查
map <LEADER><CR> :nohlsearch<CR> " 取消高亮搜索

map <C-j> <C-w>h
map <C-k> <C-w>j
map <C-i> <C-w>k
map <C-l> <C-w>l

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
vmap <Leader>c "+yy
" n 模式下复制一行到系统剪切板
nmap <Leader>c "+yy
" n 模式下粘贴系统剪切板的内容
nmap <Leader>v "+p

set number " 显示行号
set ruler " 打开状态栏标尺
set cursorline " 高亮当前行
" set cursorcolumn " 高亮当前列
set hlsearch " 高亮搜索结果
set incsearch " 输入内容时显示搜索结果

set ignorecase " 忽略大小写
set smartcase " 智能大小写

filetype indent on " 自动缩进
set expandtab " 使用空格代替制表符
set tabstop=4 " 编辑时制表符空格数
set shiftwidth=4 " 格式化制表符空格数
set softtabstop=4 " 让vim将连续数量的空格视为制表符

set autochdir " 自动切换当前目录
set backspace=indent,eol,start " 删除
set backupcopy=yes " 设置备份时覆盖

set history=500 " 记录500条历史
set mouse=a " 开启鼠标
set nobackup " 覆盖文件时不备份
set nocompatible " 设定gvim运行在增强模式下

set scrolloff=5 " 光标距离上下边界指定行数时自动滚动
set showcmd " 展示执行命令
set showmatch " 显示匹配的括号

set nowrap " 自动换行显示
set lazyredraw " 延期重绘
set encoding=utf-8

set textwidth=130

" tab 标签页切换快捷键
:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>


" 载入光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au InsertLeave *.go,*.sh,*.toml,*.sql,*.md,*.html,*.json write

" 样式
let &t_ut=''
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 安装插件
call plug#begin('~/.vim/plugged')

" 界面下方显示的状态栏
Plug 'vim-airline/vim-airline' 

" NERDTree 相关
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " 显示文件树
Plug 'jistr/vim-nerdtree-tabs' " nerdtree 的tab增强
Plug 'Xuyuanp/nerdtree-git-plugin' " 在nerdtree显示git信息

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' } " 代码补全

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } " 命令绑定管理

Plug 'tpope/vim-commentary' " 代码注释

Plug 'tpope/vim-speeddating' " 增减日期时间

Plug 'junegunn/vim-easy-align' " 快速对齐插件

Plug 'airblade/vim-gitgutter' " git信息

" 生成代码块
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'jiangmiao/auto-pairs' " 自动补全括号

" 大纲导航，显示当前文件下的变量函数
" golang需要安装gotags：go get -u github.com/jstemmer/gotags
Plug 'majutsushi/tagbar'

" 时间统计插件wakatime
Plug 'wakatime/vim-wakatime'

" 有道翻译
Plug 'ianva/vim-youdao-translater'

" Golang相关
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': '*' } " golang插件
Plug 'dgryski/vim-godef' " go代码追中，`gd`跳转

" markdown 相关
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' } " markdown 预览
Plug 'iamcco/mathjax-support-for-mkdp'

" 配色
Plug 'tomasr/molokai' " 配色
Plug 'KeitaNakamura/neodark.vim'
Plug 'crusoexia/vim-monokai'
Plug 'acarapetis/vim-colors-github'
Plug 'rakr/vim-one'


call plug#end()

"----------------------------------------------------------
"|                      配置插件                          |
"----------------------------------------------------------
"----------------------------------------------------------
" 配置颜色
"----------------------------------------------------------
set termguicolors " 开启24bit颜色
colorscheme one " 主题
set background=dark
let g:molokai_original = 1
set t_Co=256

"----------------------------------------------------------
" 配置nerdtree
"----------------------------------------------------------
map <F10> :NERDTreeToggle<CR> " 设置快捷键
let NERDTreeShowLineNumbers=1 " 显示行号
let NERDTreeAutoCenter=1 " 启动时自动打开文件树
let NERDTreeShowHidden=1 " 显示隐藏文件
let NERDTreeIgnore=['\~$', '\.swp'] "忽略文件
let NERDTreeShowBookmarks=2 " 打开 vim 文件及显示书签列表
let g:nerdtree_tabs_open_on_sonsole_startup=1 " 在终端启动vim时，共享NERDTree
" let NERDTreeWinSize=31 " 设置宽度

"----------------------------------------------------------
" 配置nerdtree-git-plugin
"----------------------------------------------------------
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeShowIgnoredStatus = 1


"----------------------------------------------------------
" 配置tagbar
"----------------------------------------------------------

nmap <F9> :TagbarToggle<CR> " 设置快捷键

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"----------------------------------------------------------
" 配置YouCompleteMe
"----------------------------------------------------------
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<space>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


"==============================================================================
" Markdown 插件
"==============================================================================
map <silent> <F5> <Plug>MarkdownPreview
map <silent> <F6> <Plug>MarkdownPreviewStop


"==============================================================================
" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2

" 配置vim-commentary
" gcc: 注释当前行
" 在VISUAL模式下按gc：注释代码块
autocmd FileType go setlocal commentstring=//\ %s 
autocmd FileType java setlocal commentstring=//\ %s 
autocmd FileType css setlocal commentstring=//\ %s 
autocmd FileType python setlocal commentstring=#\ %s 
