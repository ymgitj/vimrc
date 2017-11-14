let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
"-------------------------------------------------------------------------------------
if g:isGUI
    " au GUIEnter * simalt ~x                           "窗口启动时自动最大化
    winpos 200 500                                     "指定窗口出现的位置，坐标原点在屏幕左上角
    set lines=25 columns=160                          "指定窗口大小，lines为高度，columns为宽度
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L"
endif
"--------------------------------------
set nocompatible
syntax on
filetype off
if g:islinux
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
else
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim
    call vundle#begin('$VIM/vimfiles/bundle')    
endif
"----------------------------------------------------
Plugin 'VundleVim/Vundle.vim'
"--------------------------------------------------------
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
"-------------------------------
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline'    
"-------------------------------
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"-------------------------------
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'danro/rename.vim'
call vundle#end()
filetype plugin indent on
"------------------------------
"SET
"---
let mapleader=","
"set encoding=utf-8              "设置默认编码方式"
"set fileencoding=utf-8
set fileencodings=utf-8,cp936,gb18030,ucs-bom,big5,latin1
language messages zh_CN.utf-8       "解决控制台乱码windows 系统默认utf-8"
"set backspace=indent,eol,start      ""
set viminfo='1000,f1,<500
set noundofile
set nobackup
set noswapfile
set backspace=2                     "设置backspace可用"
set autoindent                      "自动缩进"
set smartindent                     "智能缩进"
set tabstop=4                       "tab键宽度"
set shiftwidth=4                    "换行时自动缩进宽度"
set autoread                        "外文件修改时自动重载"
set incsearch                       "搜索实时匹配"
set foldenable                                        "启用折叠
set foldmethod=indent                                 "indent 折叠方式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MAP
"""
nmap <F2> :Rename<Space>
nmap <tab> :tabn<CR>
nmap <Leader>t :tabedit<Space>
nmap <F10> :w!<CR>
imap <F10> <Esc>:w!<CR>
nmap ; :
if g:iswindows
nmap <Leader>v :tabnew ~/_vimrc<CR>
nmap <Leader>s :source ~/_vimrc<CR>
else 
nmap <Leader>v :tabnew ~/.vimrc<CR>
nmap <Leader>s :source ~/.vimrc<CR>
endif
nmap <Leader>n :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <Leader>z ZZ<CR>
nmap <Leader>q ZQ<CR>

"nmap <F5> <Esc>:!javac %<CR>
"nmap <F6> <Esc>:!java %<<CR>
"--------------------------------------------
"source
"------------------------
source $HOME/.vimrc.programs
"------------------------
"powerline
"----------------
set laststatus=2
"let g:Powerline_symbols = 'unicode'
"---------------------------------
"emmet
"------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"## Redefine trigger key
"To remap the default `<C-Y>` leader:
let g:user_emmet_expandabbr_key='<Leader>e'
"---------------------------------------------
"neocomplcache
"------------------
let g:neocomplcache_enable_at_startup = 1     "vim 启动时启用插件
"-------------------------------------
"ultisnips
"-------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"-----------------------------------------------------------
"molokai# Molokai Color Scheme for Vim
"----------
"let g:molokai_original = 1
"let g:rehash256 = 1
"--------------------------------------------------------------
let g:airline_powerline_fonts = 1
"关闭tabline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"powerline symbols
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ' '
let g:airline_symbols.readonly = ' '
let g:airline_symbols.linenr = ' '
"-----------------------
"set tags=./tags;                            "向上级目录递归查找tags文件（好像只有在Windows下才有用）
"set autochdir
"--------------------	
"indentline
"---------------------
let g:indentLine_char = "┊"
let g:indentLine_first_char = "┊"
"------------------------------------------------------
