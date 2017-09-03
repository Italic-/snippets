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

" General plugins
Plugin 'rakr/vim-two-firewatch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'mattn/webapi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'fholgado/minibufexpl.vim'
" Plugin 'vim-syntastic/syntastic'
" Languages
Plugin 'klen/python-mode'
Plugin 'rust-lang/rust.vim'
Plugin 'willzhou/oslvim'
Plugin 'racer-rust/vim-racer'
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
if !has('nvim')
	Plugin 'airblade/vim-gitgutter'
endif
Plugin 'tpope/vim-fugitive'
" Connect to Maya/Blender
Plugin 'vim-scripts/Vimya'
if !has('nvim')
	Plugin 'mipmip/vim-run-in-blender'
endif

" All of your Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on	" required


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
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#left_sep=">"
" let g:airline#extensions#tabline#left_alt_sep="|"
hi Folded ctermbg=236 ctermfg=243
hi BadWhitespace ctermbg=darkred guibg=darkred
set cursorline
set cursorcolumn
hi CursorLine cterm=None ctermbg=237
hi CursorColumn cterm=None ctermbg=237

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

" Save current buffer if modified and restore selection if possible
nmap <F8> :update<CR>
vmap <F8> <Esc><F8>gv
imap <F8> <c-o><F8>

" Force reload current file from disk and restore selection if possible
nmap <F5> :e!<CR>
vmap <F5> <Esc><F5>gv
imap <F5> <c-o><F5>

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

" Send to new line
nnoremap <C-S-O> i<Enter><Esc>l


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" MiniBufExpl options
hi MBENormal			ctermfg=244 " ctermbg=fg guifg=244 guibg=fg
hi MBEChanged			ctermfg=166 " ctermbg=fg guifg=166 guibg=fg
hi MBEVisibleNormal		ctermfg=081 " ctermbg=fg guifg=081 guibg=fg
hi MBEVisibleChanged		ctermfg=204 " ctermbg=fg guifg=204 guibg=fg
hi MBEVisibleActiveNormal	ctermfg=112 " ctermbg=fg guifg=112 guibg=fg
hi MBEVisibleActiveChanged	ctermfg=204 " ctermbg=fg guifg=204 guibg=fg

let g:miniBufExplorerAutoStart = 1
let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplBRSplit = 0
let g:did_minibufexplorer_syntax_inits = 1
" noremap <C-Tab> :MBEbn<CR>
" noremap <C-S-Tab> :MBEbp<CR>


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
	\ let g:pymode_python = 'python3' |
	\ let g:pymode_syntax_print_as_function=1 |
	\ let g:pymode_syntax=1 |
	\ let g:pymode_syntax_all=1 |
	\ let g:pymode_lint_sort = ['E', 'C', 'I'] |
	\ let g:pymode_lint_ignore = "E501" |
	\ let g:pymode_lint_checkers = ['pyflakes', 'pycodestyle', 'mccabe', 'pep257'] |
	\ let g:pymode_lint_unmodified=1 |
	\ let g:pymode_rope_lookup_project=0 |
	\ match BadWhitespace /\s\+$/ |
	\ nnoremap <Leader>p :PymodeLintAuto<CR> |
	\ nnoremap <Leader>l :PymodeLint<CR> |
	\ nnoremap <F4> :let _s=@/<Bar>:%s`\v\s+$``ge<Bar>:let @/=_s<Bar><CR> |
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


autocmd BufNewFile,FileType,BufWinEnter *.rs setlocal commentstring=//\ %s
au BufNewFile,BufRead,BufWinEnter *.rs
	\ let maplocalleader='\' |
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
	\ set autoread |
	\ set nowrap |
	\ set hidden |
	\ match BadWhitespace /\s\+$/ |
	\ let g:rustfmt_autosave=1 |
	\ let g:rust_fold=1 |
	\ let g:racer_cmd="racer" |
	\ nnoremap <Leader>l :RustFmt<CR> |
	\ nnoremap <F4> :let _s=@/<Bar>:%s`\v^(\s*//[^/!]{-}\|\s*[^/]{-}\|\n)(\s+)$`\1`ge<Bar>:let @/=_s<Bar><CR> |
	\ set completeopt=menu |


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


au BufRead,BufNewFile *.c,*.h
	\ match BadWhitespace /\s\+$/

autocmd BufRead,BufNew,BufNewFile,BufCreate *.osl
	\ set filetype=osl


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
