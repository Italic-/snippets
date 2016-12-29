set nocompatible              " required
filetype off                  " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'altercation/vim-colors-solarized'
Plugin 'klen/python-mode'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-airline/vim-airline'
Plugin 'Shougo/vimproc.vim'  " Run make from vimproc dir after install
Plugin 'Shougo/unite.vim'
Plugin 'rking/ag.vim' " yum install the_silver_searcher
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
" set foldmethod=indent
set foldlevel=99
nnoremap <space> za

highlight BadWhitespace ctermbg=darkgrey guibg=darkred
autocmd BufNewFile,FileType *.py,*.pyw setlocal commentstring=#\ %s
au BufNewFile,BufRead *.py,*.pyw
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set autoread |
    \ set nowrap |
    \ match BadWhitespace /\s\+$/ |


au BufRead,BufNewFile *.c,*.h
    \ match BadWhitespace /\s\+$/

set encoding=utf-8
set nu
set splitright
set splitbelow
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 0

autocmd BufWinEnter *.py
    \ setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py
    \ setlocal foldexpr< foldmethod<


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Unite
let g:unite_source_history_yank_enable = 1
try
    let g:unite_source_rec_async_command = 'ag --nocolor --nogroup'
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <Tab> :split<CR> :<C-U>Unite -start-insert file_rec/async<CR>
" reset not it is <C-l> normally
nnoremap <Tab>R <Plug>(unite_restart)
" end Unite

" start AG
nmap + :Ag <C-R>=expand("<cword>")<CR><CR>
nnoremap <Tab><Space> :Ag 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Useful hotkeys
" <C-Y> scroll up one line
" <C-E> scroll down one line
" <C-B> scroll up one page
" <C-F> scroll down one page
" <C-U> scroll up 1/2 page
" <C-D> scroll down 1/2 page
" zt scroll so cursor is on top
" zz scroll so cursor is in middle
" zb scroll so cursor is on bottom
" :set scb! " toggle scrollbind (scroll two windows syncronously)

" enabling causes files to be entered in delete mode(?). Line movement causes deletion.
" nnoremap <silent> <esc> :noh<cr><esc>
