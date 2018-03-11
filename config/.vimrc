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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" General plugins
Plugin 'rakr/vim-two-firewatch'           " Color scheme inspired by Firewatch
Plugin 'altercation/vim-colors-solarized' " Solarized color scheme
Plugin 'vim-airline/vim-airline'          " Status line
Plugin 'fholgado/minibufexpl.vim'         " Compact buffer list for quick navigation
Plugin 'vim-syntastic/syntastic'          " Generic syntax highlighting framework
Plugin 'tpope/vim-abolish'                " Abbreviation, substitution, case style coercion
Plugin 'idanarye/vim-vebugger'            " Interface with various debuggers (gdb, pdb, rdebug, ...)
Plugin 'bernh/pss.vim'                    " Source code searcher

" Utils
Plugin 'kopischke/vim-fetch'              " Let vim understand line/column numbers
Plugin 'mattn/webapi-vim'                 " Interface to web APIs (required for other plugins)

" Languages
Plugin 'python-mode/python-mode'          " Autocomplete, folding, execution, etc.
Plugin 'willzhou/oslvim'                  " Language + syntax

" Rust
Plugin 'rust-lang/rust.vim'               " Language + syntax
Plugin 'timonv/vim-cargo'                 " Wrapper for cargo commands
Plugin 'racer-rust/vim-racer'             " Rust autocomplete

" Searchers
Plugin 'Shougo/vimproc.vim'               " Run make from vimproc dir after install
Plugin 'junegunn/fzf'                     " Fuzzy finder (pair with ripgrep and bsf)
Plugin 'junegunn/fzf.vim'                 " Fuzzy finder vim plugin
Plugin 'rking/ag.vim'                     " yum install the_silver_searcher

" Comment/bracket helpers
Plugin 'tpope/vim-surround'               " Add/change/remove surrounding blocks like: '', \"\", <p></p>
Plugin 'tpope/vim-commentary'             " Comment lines and blocks
Plugin 'Raimondi/delimitMate'             " Automatic pairing of delimiters like (), {}, \"\", '', <>, []

" Autocomplete & Snippets
Plugin 'valloric/YouCompleteMe'           " Daemon-based autocomplete engine (must be compiled before use - see https://valloric.github.io/YouCompleteMe/
Plugin 'SirVer/ultisnips'                 " Autocomplete templates (snippets)
Plugin 'honza/vim-snippets'               " Presets for SnipMate

" Git
Plugin 'airblade/vim-gitgutter'           " Git diff visualization
Plugin 'tpope/vim-fugitive'               " Git commands from vim

" Connect to Maya/Blender
Plugin 'vim-scripts/Vimya'                " Send python script to maya
Plugin 'mipmip/vim-run-in-blender'        " Send python script to blender

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set undofile
set undodir=~/.vim/undodir
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set encoding=utf-8
set nu             " Show line numbers
set splitright     " Vertical splits send new window to right
set splitbelow     " Horizontal splits send new window to bottom
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

let g:mapleader='\'

augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" Colors
set background=dark
let g:two_firewatch_italics=1
let g:airline_theme='twofirewatch'
hi Folded ctermbg=236 ctermfg=243
hi BadWhitespace ctermbg=darkred guibg=darkred
" Line/column highlighting
set cursorline
set cursorcolumn
hi CursorLine cterm=None ctermbg=237
hi CursorColumn cterm=None ctermbg=237

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>s :set scb!<CR>  " toggle scrollbind (scroll two windows syncronously)

" Save current buffer and restore selection if possible
nmap <F8> :update<CR>
vmap <F8> <Esc><F8>gv
imap <F8> <C-O><F8>

" Force reload current file from disk and restore selection if possible
nmap <F5> :e!<CR>
vmap <F5> <Esc><F5>gv
imap <F5> <C-O><F5>

" Folding
set foldlevel=99
set foldmethod=syntax
nnoremap <Space> za

" Send to new line
nnoremap <C-S-O> i<Enter><Esc>l

" Debug
let g:vebugger_leader='<Leader>V'
nnoremap <Leader>vk :VBGkill<CR>

" Autocomplete, Ultisnips
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"
nnoremap <Leader>] :YcmCompleter GoTo<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy finders (fzf, ripgrep, bsf)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set grepprg=rg\ --vimgrep

nmap <C-P> :Files<CR>
imap <C-X><C-L> <plug>(fzf-complete-line)

let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-i': 'split',
	\ 'ctrl-s': 'vsplit'}
let g:fzf_layout = {'down': '~30%'}

let g:rg_command = '
	\ rg  --ignore-case --no-ignore --hidden --pretty
	\ --glob "$FZF_INCLUDE"
	\ --glob "$FZF_EXCLUDE_DIRS"
	\ --glob "$FZF_EXCLUDE_FILES"'

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

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

let g:miniBufExplorerAutoStart = 1
let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplBRSplit = 0
let g:did_minibufexplorer_syntax_inits = 1
" noremap <C-Tab> :MBEbn<CR>
" noremap <C-S-Tab> :MBEbp<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PYTHON SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0

autocmd BufNewFile,BufRead,FileType *.py,*.pyw
	\ setlocal commentstring=#\ %s |
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
	\ let g:pymode_lint_ignore = ["E501", "W401", "D203"] |
	\ let g:pymode_lint_checkers = ['pyflakes', 'pycodestyle', 'mccabe', 'pep257'] |
	\ let g:pymode_lint_unmodified=1 |
	\ let g:pymode_rope_lookup_project=0 |
	\ match BadWhitespace /\s\+$/ |
	\ nmap <Leader>vd :VBGstartPDB <C-R>%<CR> |
	\ nnoremap <Leader>p :PymodeLintAuto<CR> |
	\ nnoremap <Leader>l :PymodeLint<CR> |
	\ nnoremap <F4> :let _s=@/<Bar>:%s`\v\s+$``ge<Bar>:let @/=_s<Bar><CR> |
	\ set completeopt=menu |
	\ let g:pymode_folding=1 |
	" \ set foldmethod=indent |


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUST SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


autocmd BufNewFile,BufRead,BufWinEnter,FileType *.rs
	\ setlocal commentstring=//\ %s |
	\ let maplocalleader='\' |
	\ set filetype=rust |
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
	\ let g:cargo_command=":! cargo {cmd}" |
	\ nmap gd <Plug>(rust-def) |
	\ nmap gs <Plug>(rust-def-split) |
	\ nmap gx <Plug>(rust-def-vertical) |
	\ nmap <Leader>gd <Plug>(rust-doc) |
	\ nnoremap <Leader>l :RustFmt<CR> |
	\ nnoremap <F4> :let _s=@/<Bar>:%s`\v^(\s*//[^/!]{-}\|\s*[^/]{-}\|\n)(\s+)$`\1`ge<Bar>:let @/=_s<Bar><CR> |
	\ set completeopt=menu |

let g:syntastic_rust_checkers=["rustc"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAYA / BLENDER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimyaHost="localhost"
let g:vimyaPort=7720
let g:vimyaDefaultFiletype="python"
autocmd BufNewFile,BufRead,FileType *.py,*.pyw
	\ nnoremap <Leader>m :vimyaRun<CR> |
	\ vnoremap <Leader>m :vimyaRun<CR> |
	\ nnoremap <Leader>bpy :RunInBlender<CR> |
	\ vnoremap <Leader>bpy :'<,'>RunSelectionInBlender<CR> |


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


au BufRead,BufNewFile *.c,*.h
	\ match BadWhitespace /\s\+$/

autocmd BufRead,BufNew,BufNewFile,BufCreate *.osl
	\ set filetype=osl

let g:syntastic_check_on_wq=0
let g:syntastic_check_on_open=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMENTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Useful hotkeys
" zt scroll so cursor is on top
" zz scroll so cursor is in middle
" zb scroll so cursor is on bottom

" enabling causes files to be entered in delete mode(?). Line movement causes deletion.
" nnoremap <silent> <esc> :noh<CR><ESC>

" pymode refactoring: <C-C>rr (and others; see pymode docs)
