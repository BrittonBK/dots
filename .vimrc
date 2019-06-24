set nocompatible
filetype off

set shell=/bin/bash

set mouse=a
set ttymouse=sgr
set clipboard=unnamed

set conceallevel=0

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Bundle 'vim-scripts/mru.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-commentary'
Bundle 'terryma/vim-expand-region'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'tpope/vim-fugitive'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-repeat'
Bundle 'moll/vim-node'
"Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
"Bundle 'maralla/completor.vim'
"Bundle 'valloric/YouCompleteMe'
Bundle 'ajh17/VimCompletesMe'
Bundle 'pangloss/vim-javascript'
Bundle 'w0rp/ale'
Bundle 'vim-scripts/ZoomWin'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'jnurmine/Zenburn'
Bundle 'morhetz/gruvbox'
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
Bundle 'danilo-augusto/vim-afterglow'
Bundle 'wincent/Command-T'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'fenetikm/falcon'
Bundle 'itchyny/lightline.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'majutsushi/tagbar'
Bundle 'tmhedberg/matchit'
Bundle 'fatih/vim-go'
Bundle 'davidhalter/jedi-vim'
Bundle 'mileszs/ack.vim'
Bundle 'rust-lang/rust.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'mxw/vim-jsx'
Bundle 'chase/vim-ansible-yaml'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-dadbod'
Bundle 'leafgarland/typescript-vim'
Bundle 'l04m33/vlime'
Bundle 'amix/vim-zenroom2'
Bundle 'junegunn/goyo.vim'
Bundle 'ternjs/tern_for_vim'
Bundle 'ramitos/jsctags'


call vundle#end()

nnoremap <silent> <leader>z :Goyo<cr>

let g:user_emmet_leader_key='<C-Z>'

let NERDTreeQuitOnOpen = 1
map <silent> <C-n> :NERDTreeToggle<CR>
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-s>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

let MRU_Max_Entries = 400
map <leader>f :MRU<CR>
let g:yankstack_yank_keys = ['y', 'd']
"nmap <c-p> <Plug>yankstack_substitute_older_paste
"nmap <c-P> <Plug>yankstack_substitute_newer_paste
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

let g:virtualenv_directory = '.'
let g:ale_virtualenv_dir_names = ['virtualenv']

filetype plugin indent on
let g:ale_sign_column_always = 1
let g:ale_python_flake8_change_directory = 0
let g:ale_python_pylint_change_directory = 0
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_linters = {'js': ['stylelint', 'eslint']}
let g:ale_linters = {'typescript': ['stylelint', 'tslint']}
let g:ale_linters = {'ts': ['stylelint', 'tslint']}
let g:ale_linters = {'tsx': ['stylelint', 'tslint']}

set statusline+=%#warningmsg#
set statusline+=%*

let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run stable rustfmt'

"set statusline+=%{SyntasticStatuslineFlag()}
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_go_checkers = ['gometalinter']
"let g:syntastic_javascript_checkers = ['eslint']

let g:ackprg = 'rg --vimgrep'

syntax on
filetype on
filetype plugin indent on
set number
set background=dark
set title
set wildmenu
set wildmode=full
set t_Co=256

set noerrorbells
set vb t_vb=

"autocmd VimEnter * Tagbar
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd FileType crontab setlocal nowritebackup

set cursorline
set ruler
set nostartofline
set virtualedit=block
set scrolloff=3
set backspace=2
set showmatch
"set wrap
set textwidth=80
set colorcolumn=80
set linebreak
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set formatoptions=tcroql
set autowriteall
set noautoread
set modeline
set modelines=5
set ls=2
set vb t_vb=
set showcmd
set report=0
set shortmess+=a
set ruler
set laststatus=2
set ignorecase
set smartcase
set hlsearch
set incsearch


"colorscheme distinguished
"colorscheme solarized
silent! colorscheme gruvbox
"colorscheme afterglow
"colorscheme falcon

hi Normal ctermbg=none
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

let g:multi_cursor_next_key="\<C-s>"



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

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

autocmd FileType tf setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal colorcolumn=100
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setlocal colorcolumn=88
autocmd FileType go setlocal colorcolumn=100

set spell
set spelllang=en_us

hi clear SpellBad
hi SpellBad cterm=underline

autocmd filetype crontab setlocal nobackup nowritebackup
nnoremap <silent> <C-w>z :ZoomWin<CR>

let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1

