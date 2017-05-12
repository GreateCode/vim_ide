"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: chxuan <787280310@qq.com>
" Source: https://github.com/chxuan/vimplus

" genernal settings
syntax enable
syntax on
set t_Co=256
set cul 
set shortmess=atI   
autocmd InsertEnter * se cul    
set ruler           
set showcmd         
set scrolloff=3     
set laststatus=2
set autoindent
set smartindent
set cindent
set cinoptions=g0,:0,N-s,(0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set number
set history=1000
set hlsearch
set incsearch
set langmenu=zh_CN.UTF-8
set helplang=cn
set cmdheight=2
set autoread
set completeopt=preview,menu 
set autowrite
set magic                   
set guioptions-=T           
set guioptions-=m           
set nocompatible
set noeb
set confirm
set nobackup
set noswapfile
set ignorecase
set linespace=0
set wildmenu
set backspace=2
set whichwrap+=<,>,h,l
set mouse=a
set mouse=v
set selection=exclusive
set selectmode=mouse,key
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=1
set scrolloff=3
set completeopt=longest,menu
set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
filetype on
filetype plugin on
filetype indent on
set foldmethod=indent
set foldmethod=syntax
set nofoldenable

" create file settings
autocmd BufNewFile *.cpp,*.cc,*.c,*.hpp,*.h,*.sh,*.py exec ":call SetTitle()" 
func SetTitle() 
	if expand("%:e") == 'sh'
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 
    elseif expand("%:e") == 'cpp'
		call setline(1,"#include <iostream>") 
        call append(line("."),"using namespace std;")
		call append(line("."), "") 
    elseif expand("%:e") == 'cc'
		call setline(1,"#include <iostream>") 
		call append(line("."), "") 
    elseif expand("%:e") == 'c'
		call setline(1,"#include <stdio.h>") 
		call append(line("."), "") 
    elseif expand("%:e") == 'h'
		call setline(1, "#ifndef _".toupper(expand("%:r"))."_H")
		call setline(2, "#define _".toupper(expand("%:r"))."_H")
		call setline(3, "#endif")
    elseif expand("%:e") == 'hpp'
		call setline(1, "#ifndef _".toupper(expand("%:r"))."_H")
		call setline(2, "#define _".toupper(expand("%:r"))."_H")
		call setline(3, "#endif")
	endif
endfunc 
autocmd BufNewFile * normal G

" Vundle
set nocompatible              
filetype off        

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'STL-Syntax'
Plugin 'OmniCppComplete'
Plugin 'chxuan/change-colorscheme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Valloric/MatchTagAlways'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'docunext/closetag.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'vim-scripts/txt.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'will133/vim-dirdiff'
Plugin 'haya14busa/incsearch.vim'
Plugin 'mhinz/vim-startify'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'flazz/vim-colorschemes'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/neocomplete.vim'


call vundle#end()            
filetype plugin indent on    

" load vim default plugin
runtime macros/matchit.vim

" change-colorscheme
map <F8> :NextColorScheme<CR>
imap <F8> <ESC> :NextColorScheme<CR>
map <F9> :PreviousColorScheme<CR>
imap <F9> <ESC> :PreviousColorScheme<CR>
colorscheme blues

let c_no_curly_error=1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1



" nerdtree
let NERDTreeWinPos=1
map <F4> :NERDTreeToggle<CR>
imap <F4> <ESC> :NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Doxygen
let g:DoxygenToolkit_authorName="chxuan, 787280310@qq.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_commentType="Qt"
nmap  <F6> :Dox<cr>

" YCM
let g:ycm_confirm_extra_conf = 0 
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1 
let g:ycm_complete_in_strings = 1 
"let g:ycm_cache_omnifunc = 0 
""let mapleader = ","
""nnoremap <leader>u :YcmCompleter GoToDeclaration<CR>
""nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
""nnoremap <leader>o :YcmCompleter GoToInclude<CR>
""nmap <F5> :YcmDiags<CR>

"""""""""""""" omni begin """""""""""""""""""""""""
"自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,longest,menu

"代码补全窗口美化
highlight Pmenu 	guibg=darkgrey 	guifg=black
highlight PmenuSel 	guibg=lightgrep guibg=black

"补全文件和变量
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType=2

"解决tab键被占用问题
let g:SuperTabMappingForward="<tab>"
let g:SuperTabMappingBackward="s-tab"

let g:syntastic_cpp_compiler_options = ' -std=c++11'

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
" 加入系统索引
set tags+=~/.vim/my_tags/cpp
set tags+=~/.vim/my_tags/usr_inc
set tags+=~/.vim/my_tags/glog
set tags+=~/.vim/my_tags/curl
set tags+=~/.vim/my_tags/mysql++
set tags+=~/.vim/my_tags/libc
set tags+=~/.vim/my_tags/protobuf
set tags+=tags;
set autochdir
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

""""""""""""" omni end """"""""""""""""""""""

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

" 设置neocomplete.vim
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
	return (pumvisible() ? "\<C-y>" : "" )
	" For no inserting <CR> key.
	" return pumvisible() ? "\<C-y>" : "\<CR>"
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
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)')'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::')'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"**************************** end *****************************


" ctags
set tags+=/usr/include/tags
set tags+=~/.vim/systags
set tags+=~/.vim/x86_64-linux-gnu-systags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers = {} 
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&',']']

" a.vim: .h -> .cpp or .cpp -> .h
nnoremap <silent> <F2> :A<CR>

" tagbar
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_sort = 0
let g:tagbar_left = 1
map <F3> :TagbarToggle<CR>
imap <F3> <ESC> :TagbarToggle<CR>

" 专配 go 语言
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
    \} 


" colorscheme
set background=dark
let g:solarized_termcolors=256
"colorscheme blues

" cpp_class_scope_highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1

" airline
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" ctrlp
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = '0'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" vim-devicons
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"vim.go 高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

set tags+=~/.vim/my_tags/boost/accumulators
set tags+=~/.vim/my_tags/boost/algorithm
set tags+=~/.vim/my_tags/boost/archive
set tags+=~/.vim/my_tags/boost/asio
set tags+=~/.vim/my_tags/boost/assign
set tags+=~/.vim/my_tags/boost/atomic
set tags+=~/.vim/my_tags/boost/bimap
set tags+=~/.vim/my_tags/boost/bind
set tags+=~/.vim/my_tags/boost/chrono
set tags+=~/.vim/my_tags/boost/circular_buffer
set tags+=~/.vim/my_tags/boost/compatibility
set tags+=~/.vim/my_tags/boost/concept
set tags+=~/.vim/my_tags/boost/concept_check
set tags+=~/.vim/my_tags/boost/config
set tags+=~/.vim/my_tags/boost/container
set tags+=~/.vim/my_tags/boost/context
set tags+=~/.vim/my_tags/boost/coroutine
set tags+=~/.vim/my_tags/boost/date_time
set tags+=~/.vim/my_tags/boost/detail
set tags+=~/.vim/my_tags/boost/dynamic_bitset
set tags+=~/.vim/my_tags/boost/exception
set tags+=~/.vim/my_tags/boost/filesystem
set tags+=~/.vim/my_tags/boost/flyweight
set tags+=~/.vim/my_tags/boost/format
set tags+=~/.vim/my_tags/boost/function
set tags+=~/.vim/my_tags/boost/functional
set tags+=~/.vim/my_tags/boost/function_types
set tags+=~/.vim/my_tags/boost/fusion
set tags+=~/.vim/my_tags/boost/geometry
set tags+=~/.vim/my_tags/boost/gil
set tags+=~/.vim/my_tags/boost/graph
set tags+=~/.vim/my_tags/boost/heap
set tags+=~/.vim/my_tags/boost/icl
set tags+=~/.vim/my_tags/boost/integer
set tags+=~/.vim/my_tags/boost/interprocess
set tags+=~/.vim/my_tags/boost/intrusive
set tags+=~/.vim/my_tags/boost/io
set tags+=~/.vim/my_tags/boost/iostreams
set tags+=~/.vim/my_tags/boost/iterator
set tags+=~/.vim/my_tags/boost/lambda
set tags+=~/.vim/my_tags/boost/locale
set tags+=~/.vim/my_tags/boost/local_function
set tags+=~/.vim/my_tags/boost/lockfree
set tags+=~/.vim/my_tags/boost/logic
set tags+=~/.vim/my_tags/boost/math
set tags+=~/.vim/my_tags/boost/move
set tags+=~/.vim/my_tags/boost/mpi
set tags+=~/.vim/my_tags/boost/mpl
set tags+=~/.vim/my_tags/boost/msm
set tags+=~/.vim/my_tags/boost/multi_array
set tags+=~/.vim/my_tags/boost/multi_index
set tags+=~/.vim/my_tags/boost/multiprecision
set tags+=~/.vim/my_tags/boost/numeric
set tags+=~/.vim/my_tags/boost/optional
set tags+=~/.vim/my_tags/boost/parameter
set tags+=~/.vim/my_tags/boost/pending
set tags+=~/.vim/my_tags/boost/phoenix
set tags+=~/.vim/my_tags/boost/polygon
set tags+=~/.vim/my_tags/boost/pool
set tags+=~/.vim/my_tags/boost/preprocessor
set tags+=~/.vim/my_tags/boost/program_options
set tags+=~/.vim/my_tags/boost/property_map
set tags+=~/.vim/my_tags/boost/property_tree
set tags+=~/.vim/my_tags/boost/proto
set tags+=~/.vim/my_tags/boost/ptr_container
set tags+=~/.vim/my_tags/boost/python
set tags+=~/.vim/my_tags/boost/random
set tags+=~/.vim/my_tags/boost/range
set tags+=~/.vim/my_tags/boost/ratio
set tags+=~/.vim/my_tags/boost/regex
set tags+=~/.vim/my_tags/boost/serialization
set tags+=~/.vim/my_tags/boost/signals
set tags+=~/.vim/my_tags/boost/signals2
set tags+=~/.vim/my_tags/boost/smart_ptr
set tags+=~/.vim/my_tags/boost/spirit
set tags+=~/.vim/my_tags/boost/statechart
set tags+=~/.vim/my_tags/boost/system
set tags+=~/.vim/my_tags/boost/test
set tags+=~/.vim/my_tags/boost/thread
set tags+=~/.vim/my_tags/boost/timer
set tags+=~/.vim/my_tags/boost/tr1
set tags+=~/.vim/my_tags/boost/tuple
set tags+=~/.vim/my_tags/boost/type_traits
set tags+=~/.vim/my_tags/boost/units
set tags+=~/.vim/my_tags/boost/unordered
set tags+=~/.vim/my_tags/boost/utility
set tags+=~/.vim/my_tags/boost/uuid
set tags+=~/.vim/my_tags/boost/variant
set tags+=~/.vim/my_tags/boost/wave
set tags+=~/.vim/my_tags/boost/xpressive
