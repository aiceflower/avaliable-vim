" 开启语法高亮  
syntax enable  

"设置光标行显示下划线
set cursorline
"black, brown, grey, blue, green, cyan, magenta, yellow, white。
hi CursorLine   cterm=NONE ctermbg=grey ctermfg=white guibg=blue guifg=white
"高亮当前列
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white



" 显示不可见字符
set nolist
"set list

" 开启语法高亮
syntax on  

" 设置字体  
set guifont=Monaco\ 12

" 设置历史记录条数  
set history=2000  

" 检测文件类型  
filetype on  

" 针对不同的文件，采用不同的缩进方式  
filetype indent on  

" 允许插件  
filetype plugin on  

" 启动自动补全
filetype plugin indent on

" 文件修改之后自动读入
set autoread

" 启动后不显示提示
"set shortmess=atI

" 设置取消备份，禁止临时文件生成  
"set nobackup  
"set noswapfile  

" create undo file
set undolevels=1000 " how many undos
if v:version >= 730
    set undofile     " keep a persistent backup file
    set undodir=/tmp/vimundo/
endif

"set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" 显示当前横竖线  
"set cursorline  
"set cursorcolumn  

" 设置退出Vim之后内容显示在终端屏幕，可以用于查看和复制
" 好处:误删什么，如果以前屏幕打开可以用来找回
" set t_ti= t_te=

" 设置在Vim中可以使用鼠标，防止终端无法拷贝  

" 显示当前行号和列号
set ruler

" 在状态栏显示正在输入的命令
set showcmd

" 左下角显示当前Vim模式
set showmode

" 光标移动至少保留的行数
"set scrolloff=7

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" 总是显示状态栏(Powerline需要2行)  
set laststatus=2  

" 显示行号  
set number  

" 指定不折行
set nowrap  

" 设置代码匹配,包括括号匹配情况  
set showmatch  

" how many tenths of a second to blink when matching brackets
" setmatchtime=2

" 开启及时搜索(is)  
set incsearch  

" 设置搜索高亮(hlsearch)  
set hls  

" 设置搜索时忽略大小写  
set ignorecase  

" 当搜索的时候尝试smart  
set smartcase  

" 设置代码折叠
"set foldenable
" 折叠方法
" manual 手工折叠
" indent 缩进折叠
" expr 表达式折叠
" syntax 语法折叠
" diff 对没有更改的文件折叠
" marker 标记折叠
"set foldmethod=indent
"set foldlevel=99

" 设置C/C++方式自动对齐  
set autoindent  
set cindent  
set smartindent  

" 设置tab宽度  
set tabstop=4  

" 设置自动对齐空格数  
set shiftwidth=4  

" 按退格键时可以一次删除4个空格
"set softtabstop=4

 " 编辑的时候将所有的tab设置为空格(expandtab)  
 set et  

 " 使用Backspace直接删除tab  
 set smarttab  

" 不在单词中间折行  
set lbr  
 "==========================================
 " FileEncode Settings
 "==========================================

 " 设置编码方式  
 set encoding=utf-8  

 " 设置打开文件的编码格式  
 set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  

 set helplang=cn 

 " 只对终端影响(默认)
 set termencoding=utf-8

 " use UNIX as the standard file type
 set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m

" 合并两行中文时，不在中间加空格：
set formatoptions+=B

"==========================================
" Other Settings
"==========================================
 " 自动补全配置让Vim补全菜单行为跟IDE一致
"set completeopt=longest,menu

 " 增强模式中的命令行自动完成操作
"set wildmenu

 " ignore compiled files
 " set wildignore=*.o,*~,*.pyc,*.class

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" HotKey Settings
"==========================================
"
" 去掉搜索高亮
"noremap <silent><leader>/ :nohls<CR>
map <leader>/ :nohls<CR>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" 手动刷新tags(含cscope)
nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>:set tags+=./tags<CR>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR>

" 切换buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" cscope设置
if has("cscope")
    set csprg=/usr/bin/cscope   " 制定cscope命令
    set csto=0                  " ctags查找顺序，0表示先cscope数据库再标签文件，1表示先标签文件爱
    set cst                     " 同时搜索tag文件和cscope数据库
    set cscopequickfix=s-,c-,d-,i-,t-,e-  "使用QucikFix窗口来显示cscope查找结果
    set nocsverb
    if filereadable("cscope.out")  "如果当前目录下有cscope.out则加载进Vim
        cs add cscope.out
    elseif $CSCOPE_DB != ""       "否则只要环境变量不为空就添加制定的数据库到Vim
        cs add $CSCOPE_DB
    endif
    set csverb
endif
"map <F4>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
" 查找符号
nmap <leader>css :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" 查找定义
nmap <leader>csg :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找被这个函数调用的函数
nmap <leader>csd :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" 查找调用这个函数的函数
nmap <leader>csc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
" 查找这个字符串
nmap <leader>cst :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
" 查找这个egrep匹配模式
nmap <leader>cse :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
" 查找这个文件
nmap <leader>csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 查找include这个文件的文件
nmap <leader>csi :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>

" 设定是否使用QuickFix来显示结果
set cscopequickfix=s-,c-,d-,i-,t-,e-

" QuickFix open and close
nnoremap <F11> :copen<CR>
nnoremap <F12> :cclose<CR>

" QucikFix next and prev
nnoremap <F9> :cn<CR>
nnoremap <F10> :cp<CR>

"==========================================
" Theme Settings
"==========================================

" Set extra options when running in GUI mode
"if has("gui_running")
"    set guifont=Monaco\ 12
"    set guioptions-=T
"    set guioptions+=e
"    set guioptions-=r
"    set guioptions-=L
"    set guitablabel=%M\ %t
"    set showtabline=1 
"    set linespace=2 
"    set noimd   
"    set t_Co=256
"endif

" 设置主题  
set background=dark
"colorscheme solarized
set t_Co=256

" 添加水平滚动条  
"set guioptions+=b  

" 取消菜单栏和导航栏  
set guioptions-=m  
set guioptions-=T  

" 去除左右两边滚动条
set go-=r
set go-=L

" 设置水平行数和竖直列数  
"set lines=35  
"set columns=99  

"--------------plugin-----------------
"插件管理
set nocompatible " 设置vim为不兼容vi模式  
filetype off " required  
set rtp+=~/.vim/bundle/vundle/
"如果在windows下使用，设置为  
""set rtp+=$HOME/.vim/bundle/vundle/  
call vundle#rc()
"let Vundle manage Vundle  
"Bundle 'gmarik/vundle'
""Bundles托管插件示例  
"代码在github上,使用github帐号/项目名，例如：  
""Bundle 'tpope/vim-fugitive'  
Bundle 'jiangmiao/auto-pairs'  
Bundle 'junegunn/fzf'
"代码在vimscript上，使用插件名称，插件名字可以在  
""http://vim-scripts.org/vim/scripts.html页面中查找，例如：  
"Bundle 'vimwiki'  
""非github的插件，使用其git地址，例如：  
"Bundle 'git://git.wincent.com/command-t.git'  
"filetype plugin indent on " required!  
""Brief help  
":BundleList - list configured bundles  
"":BundleInstall(!) - install(update) bundles  
":BundleSearch(!) foo - search(or refresh cache first) for foo  
"":BundleClean(!) - 删除插件首先要在.vimrc中注释掉插件相应的行，再运行该命令  
"  
"  "see :h vundle for more details or wiki for FAQ  
"  "NOTE: comments after Bundle command are not allowed..  
"------------------------------------------------------------


"MiniBufExplorer
let g:miniBufExplMaxSize = 2 
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavArrows = 1  
"let g:miniBufExplMapWindowNavVim = 1  
"let g:miniBufExplMapCTabSwitchWindows = 1  
"let g:miniBufExplMapCTabSwitchBufs = 1   
"let g:miniBufExplModSelTarget = 1  
"解决FileExplorer窗口变小问题  
"let g:miniBufExplForceSyntaxEnable = 1  
"let g:miniBufExplorerMoreThanOne=2

"taglist
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联 
nnoremap <silent><F3> :TlistToggle<CR>

"NERDTree
"默认开启NERDTree
"autocmd VimEnter * NERDTree 
map <F10> :NERDTreeToggle<CR>
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeShowHidden=0"
"剩下一个窗口时自动关闭
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

"winmanager配置
"默认开启winmanager
let g:AutoOpenWinManager = 1 

let g:winManagerWindowLayout='FileExplorer|TagList'
"设置高度
let g:bufExplorerMaxHeight=30
let g:miniBufExplorerMoreThanOne=0

"打开快捷键
nmap wm :WMToggle<cr>
map <silent> <F9> :WMToggle<cr>

"Auto Pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

"python配置
filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_menu_height = 5   
" 自动跳出括号
func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        return "\<ESC><$>a"
    else
        return "\t"
    endif
endfunc
inoremap vv <ESC>$a
"快捷键映射
map <C-J> <C-W>j<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-K> <C-W>k<C-W>_
map vv $
" Use vim_shortcut_key config if available {
    if filereadable(expand("~/.vim_shortcut_key1"))
        source ~/.vim_shortcut_key 
    endif
" }

"配置文件模板
autocmd BufNewFile *.cpp 0r ~/.vim/vim_file_template/cpp.temp
