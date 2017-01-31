set nocompatible	" required
filetype off		" required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Languages and general plugins
Plugin 'rakr/vim-two-firewatch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-syntastic/syntastic'
Plugin 'mattn/webapi-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'klen/python-mode'
Plugin 'tmhedberg/SimpylFold'
Plugin 'fholgado/minibufexpl.vim'
" Searchers
Plugin 'Shougo/vimproc.vim'  " Run make from vimproc dir after install
Plugin 'Shougo/unite.vim'
Plugin 'rking/ag.vim' " yum install the_silver_searcher
" Comment/bracket helpers
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Connect to Maya/Blender
Plugin 'vim-scripts/Vimya'
Plugin 'mipmip/vim-run-in-blender'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:mapleader='\'
augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

let g:two_firewatch_italics=1
let g:airline_theme='twofirewatch'
hi Folded ctermbg=236 ctermfg=243
hi BadWhitespace ctermbg=darkgrey guibg=darkred

set encoding=utf-8
set nu
set splitright
set splitbelow
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>s :set scb!<CR>  " toggle scrollbind (scroll two windows syncronously)

" Folding
set foldlevel=99
nnoremap <Space> za

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 0

" Unite
let g:unite_source_history_yank_enable = 1
try
	let g:unite_source_rec_async_command = 'ag --nocolor --nogroup'
	call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" Search in the file tree
nnoremap <Tab> :split<CR> :<C-U>Unite -start-insert file_rec/async<CR>
" Reset Unite
nnoremap <Tab>R <Plug>(unite_restart)

" AG - The Silver Searcher
nmap + :Ag <C-R>=expand("<cword>")<CR><CR>
nnoremap <Tab><Space> :Ag 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" MiniBufExpl options
hi MBENormal			ctermfg=244 " ctermbg=fg guifg=244 guibg=fg
hi MBEChanged			ctermfg=166 " ctermbg=fg guifg=166 guibg=fg
hi MBEVisibleNormal		ctermfg=081 " ctermbg=fg guifg=081 guibg=fg
hi MBEVisibleChanged		ctermfg=204 " ctermbg=fg guifg=204 guibg=fg
hi MBEVisibleActiveNormal	ctermfg=112 " ctermbg=fg guifg=112 guibg=fg
hi MBEVisibleActiveChanged	ctermfg=204 " ctermbg=fg guifg=204 guibg=fg

let g:miniBufExplBRSplit = 0
let g:did_minibufexplorer_syntax_inits = 1
noremap <C-Tab>			:MBEbn<CR>
noremap <C-S-Tab> 		:MBEbp<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PYTHON SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


autocmd BufNewFile,FileType *.py,*.pyw setlocal commentstring=#\ %s
au BufNewFile,BufRead *.py,*.pyw
	\ let maplocalleader='\' |
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
	\ set autoread |
	\ set nowrap |
	\ let g:pymode_syntax=1 |
	\ let g:pymode_syntax_all=1 |
	\ let g:pymode_syntax_indent_errors=g:pymode_syntax_all |
	\ let g:pymode_syntax_space_errors=g:pymode_syntax_all |
	\ let g:pymode_lint_sort = ['E', 'C', 'I'] |
	\ let g:pymode_lint_ignore = "E501" |
	\ let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pep257'] |
	\ let g:pymode_lint_unmodified=1 |
	\ match BadWhitespace /\s\+$/ |
	\ nnoremap <Leader>p :PymodeLintAuto<cr> |
	\ nnoremap <Leader>l :PymodeLint<cr> |
	\ set completeopt=menu |
	" \ let g:pymode_folding=1 |
	" \ set foldmethod=indent |

autocmd BufWinEnter *.py,*.pyw
	\ setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py,*.pyw
	\ setlocal foldexpr< foldmethod<


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUST SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:rustfmt_autosave=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


au BufRead,BufNewFile *.c,*.h
	\ match BadWhitespace /\s\+$/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMENTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Useful hotkeys
" zt scroll so cursor is on top
" zz scroll so cursor is in middle
" zb scroll so cursor is on bottom
" :set scb! " toggle scrollbind (scroll two windows syncronously)

" enabling causes files to be entered in delete mode(?). Line movement causes deletion.
" nnoremap <silent> <esc> :noh<cr><esc>
