set nocompatible    " We are running Vim, not Vi!

set mouse=a
set columns=80  " number of columns in the display
syntax on   " Enable vim's syntax highlighting.
set number  " Turn on line numbers:
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab  " use space when <Tab> is inserted

set encoding=utf-8
set fileencoding=utf-8

set linebreak showbreak=>>  " wrap long lines at a space instead of in the middle of a word
set sidescroll=5    " The minimal number of columns to scroll horizontally.

set incsearch   " highlight matched string while typing a search command
set ignorecase  " ignore case in search patterns

set cursorcolumn cursorline

set laststatus=2    " Always display a status line at the bottom of the window
set statusline=%F   " Show full path in status line

" Syntax color
set background=dark
set t_Co=256

"自動檢測文件類型並縮排
filetype plugin indent on

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My bundles
Bundle 'gmarik/vundle'
Bundle 'pyflakes.vim'
Bundle 'rkulla/pydiction'
Bundle 'scrooloose/nerdtree'
Bundle 'Shougo/neocomplcache'
Bundle 'majutsushi/tagbar'
" end of Vundle

function! Notice()
 if !exists("g:record_now")
   let g:record_now = str2nr(strftime("%H"))
 endif
 if str2nr(strftime("%H")) - g:record_now >= 1
   let g:record_now = str2nr(strftime("%H"))
   echo "一個小時，該休息一下了"
 endif
endfunction

augroup funny
 autocmd!
 " autocmd BufEnter * call ChangeColors()
 autocmd BufEnter * call Notice()
augroup END

" File specific setting
" Java
augroup java
 " Clear old autocmds in group
 autocmd!
 autocmd FileType java set ai sw=4 sts=4
augroup END

" Python
augroup filetype_python
 autocmd!
 autocmd FileType python set ai sw=4 sts=4

 "set pydiction_location for pydiction which allow to Tab-complete Python code in Vim
 let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
augroup END

augroup jelly
   autocmd!
   autocmd BufRead,BufNewFile *.jelly set ft=xml
augroup END

" ***********************************************************************
" Key Mappings
nnoremap <silent> <F5> :NERDTree<CR>
nnoremap <C-H> :tabprevious<CR>
nnoremap <C-L> :tabnext<CR>
nmap <F8> :TagbarToggle<CR>

" pressing < or > will let you indent/unindent selected lines
vnoremap < <gv
vnoremap > >gv

let g:neocomplcache_enable_at_startup = 1

" highlight PyFlakes term=underline cterm= underline

