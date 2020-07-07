call plug#begin('~/.vim/autoload')
Plug 'beanworks/vim-phpfmt'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neocomplete.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomasr/molokai'
Plug 'luochen1990/rainbow'
Plug 'tomtom/tcomment_vim'
call plug#end()

" ------NEADTree相关-----
"  在控制台vim启动时打开 NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
"  如果打开某个目录，请在启动时启用焦点 NERDTree，如果打开文件，则为焦点文件。 ( 当设置为 2 时，启动后总是聚焦文件窗口)。
let g:nerdtree_tabs_smart_startup_focus=1
"  如果当前窗口中只有一个窗口并且它是 NERDTree，则关闭当前选项卡
let g:nerdtree_tabs_autoclose=1
"  在新建选项卡创建 NERDTree
let g:nerdtree_tabs_open_on_new_tab=1
"  在NREDTree中自动查找并选择当前打开的文件
let g:nerdtree_tabs_autofind=1

map <C-n> :NERDTreeToggle<CR>



" ------airline相关------
"  显示标签栏
let g:airline#extensions#tabline#enabled = 1
"  主题选择
let g:airline_theme='dark'
"  字体选择（前提是安装了powerline字体：sudo apt-get install fonts-powerline）
let g:airline_powerline_fonts = 1

" -----------neocomplete相关------摘自neocomplete github 官网
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" -----------Molokai主题相关-----------
colorscheme molokai
" -----------ctags相关----------------
set tags=tags;
set autochdir
" -----------taglist相关--------------
"启动vim后自动打开taglist窗口
let Tlist_Auto_Open = 0

"不同时显示多个文件的tag，仅显示一个
let Tlist_Show_One_File = 1

"taglist为最后一个窗口时，退出vim
let Tlist_Exit_OnlyWindow = 1

"taglist窗口显示在右侧，缺省为左侧
let Tlist_Use_Right_Window =1

"设置taglist窗口大小
"let Tlist_WinHeight = 100
let Tlist_WinWidth = 40

"设置taglist打开关闭的快捷键Ctrl+l
noremap <C-L> :TlistToggle<CR>
" -----------Ctrlp相关------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=1
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" -----------parentheses(括号匹配)---
let g:rainbow_active = 1

" -----------vim基础功能----------
set nocompatible	" 不与vi兼容，采用vim自己的操作命令
syntax on		" 语法高亮
let loaded_matchparen=1	" 关闭括号高亮匹配
set mouse=a		" 支持鼠标
set number		" 显示行号
filetype indent on	" 开启文件类型检查，并且载入与该类型对应的缩进规则

set laststatus=2	" 总显示最后一个窗口的状态行
set ruler		" 标尺，用于显示光标位置的行号和列号

set showcmd		" 命令行显示输入的命令
set showmode		" 命令行显示vim当前模式

set incsearch		" 输入字符串就显示匹配点
set hlsearch		" 高亮搜索
"set showmatch		" 输入括号时短暂跳转到匹配括号处

set scrolloff=5		" 光标距离底部和顶部的偏移行数
set cursorline		" 行高亮
set smartindent		" 换行时使用智能缩进
set cindent
" 针对python，java，C++文件 设置tab键为4个空格，并自动将tab转换成空格
autocmd FileType python,java,cpp set autoindent
autocmd FileType python,java,cpp set expandtab
autocmd FileType python,java,cpp set shiftwidth=4
autocmd FileType python,java,cpp set tabstop=4
autocmd FileType python,java,cpp set softtabstop=4
" 针对C文件（kernel）,设置tab键为8个空格，不用转换
autocmd FileType c set ai
autocmd FileType c set sw=8
autocmd FileType c set ts=8
autocmd FileType c set sts=8
set smarttab

set list
"set listchars=tab:>-,space:-
set listchars=tab:>-

" ---------自定义命令-----------
vmap <C-C> "+y
vmap <C-V> "+p
map <C-A> ggVG
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a
command! -nargs=? Logger execute 'vim /<args>/%' | copen 20
