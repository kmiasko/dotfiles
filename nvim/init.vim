set shell=/bin/bash
set nocompatible "prevent arrow keys from inserting A B C D

filetype off

let mapleader = ","

set rtp+=~/.fzf

" call vundle#begin()
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

" Libs
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" General code editing
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake', { 'do': 'npm install --cache-min Infinity --loglevel http -g eslint_d jsonlint' }

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" UI
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-airline/vim-airline'


let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 0
" let g:airline_theme='oceanicnext'
let g:airline_theme='gruvbox'

" Git

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Code search / file search
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1
map <leader>f :VimFilerCurrentDir<CR>

" HTML css
Plug 'mattn/emmet-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'

" JS
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'


Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'mklabs/jscs.vim', { 'do': 'npm i jscs -g' }
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'elzr/vim-json'
Plug 'https://github.com/Quramy/tsuquyomi'
Plug 'othree/jspc.vim'

" TS
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'


" Code complete
" Plug 'Shougo/deoplete.nvim'
" Plug 'ternjs/tern_for_vim',       { 'do': 'npm install --cache-min Infinity --loglevel http' }
" Plug 'carlitux/deoplete-ternjs',  { 'do': 'npm install --cache-min Infinity --loglevel http -g tern' }
Plug 'neovim/node-host',          { 'do': 'npm install --cache-min Infinity --loglevel http' }
Plug 'moll/vim-node'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

set shortmess+=c
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/home/kmiasko/tmp/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'javascript.jsx': ['/home/kmiasko/tmp/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F5> :call LanguageClient_workspace_symbol()<CR>
nnoremap <silent> <F4> :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F3> :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" redux course
Plug 'cohama/lexima.vim'
let g:lexima_enable_basic_rules=1
let g:lexima_enable_newline_rules=1

Plug 'digitaltoad/vim-pug'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-underscore'
Plug 'machakann/vim-textobj-delimited'
Plug 'terryma/vim-multiple-cursors'


" (Assuming settings like the following)
set completeopt=longest,menuone,preview
" let g:deoplete#enable_at_startup=1

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" augroup omnifuncs
"   autocmd!
"   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" augroup end

" let deoplete#tag#cache_limit_size = 5000000
" let g:deoplete#sources = {}
" let g:deoplete#omni#functions = {}
" let g:deoplete#sources._ = ['file', 'neosnippet', 'buffer', 'tag']
" let g:deoplete#sources.elixir = ['alchemist']
" let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
" let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'ternjs']
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#omni#functions.javascript = [
"       \ 'tern#Complete',
"       \ 'jspc#omni',
"       \]
" let g:deoplete#omni#functions["javascript.jsx"] = [
"       \ 'tern#Complete',
"       \ 'jspc#omni',
"       \]

" let g:tern#arguments = ['--persistent']
" let g:tern#command = ['tern']
" let g:tern_request_timeout=1
" let g:tern_show_argument_hints = 'on_hold'
" let g:tern_show_signature_in_pum = 1
" autocmd FileType javascript setlocal omnifunc=tern#Complete
" autocmd FileType javascript.jsx setlocal omnifunc=tern#Complete

" Stuff
Plug 'dag/vim-fish'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

call plug#end()

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
" or just disable the preview entirely
set completeopt-=preview
let g:UltiSnipsExpandTrigger        = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger   = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpBackwardTrigger  = "<Plug>(ultisnips_backward)"
let g:UltiSnipsListSnippets         = "<Plug>(ultisnips_list)"
let g:UltiSnipsRemoveSelectModeMappings = 0

nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>. :AgIn

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWithAgInDirectory(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction
command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}
"
set clipboard=unnamed
filetype plugin indent on

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
" colorscheme OceanicNext
set background=dark
colorscheme gruvbox
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\
set laststatus=2
set noshowmode

set nobackup
set nowritebackup
set noswapfile

" set the search scan to wrap lines
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" make command line two lines high
set ch=1

" disable audible bell
set vb

" allow backspacing over indent, eol, and the start of an insert
set backspace=2

" make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" drop a marker at the end of a change area (ie using 'cw') instead of
" deleting it
set cpoptions=Bces$

" always show status line, even if only one window
set laststatus=2

" show current command (leader key, etc) in lower right
set showcmd

" scroll when 4 lines from top or bottom
set scrolloff=4

" allow the cursor to go in to "invalid" places
set virtualedit=block

" span command-line completions horizontally
set wildmenu

" get rid of the characters in window separators
set fillchars=""

set tabstop=2
set shiftwidth=2

" enable search highlighting
set hlsearch
" search for matches as we type
set incsearch

" show line numbers
set number

" show preview and help window at bottom
set splitbelow

" hide the mouse pointer while typing
set mousehide

" set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175


" show/hide current line highlight
autocmd BufNewFile,BufRead *.svg set filetype=xml
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .jshintrc set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd BufNewFile,BufRead .tern-project filetype=json
autocmd BufNewFile,BufRead *.es6 set filetype=javascript


set magic " Set magic on, for regex

" jump to eol in insert mode with C-]
inoremap <C-]> <End>

" jump to current error with ,l
map <leader>l :ll<CR>

" indent guides
let g:neomake_list_height = 2
let g:neomake_open_list = 2
let g:neomake_javascript_eslint_exe = '/home/kmiasko/.nvm/versions/node/v7.4.0/bin/eslint_d'
let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_scss_enabled_makers = ['sasslint']

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

autocmd! BufWritePost * Neomake

" emmet
let g:user_emmet_leader_key='<C-e>'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

nnoremap <C-left> :vertical resize +5<cr>
nnoremap <C-right> :vertical resize -5<cr>
nnoremap <C-up> :resize +5<cr>
nnoremap <C-down> :resize -5<cr>
nnoremap <silent> <right> :bnext<cr>
nnoremap <silent> <left> :bprev<cr>

let g:used_javascript_libs = 'react,underscore,ramda,jasmine,chai'

inoremap jk <ESC>

set expandtab
autocmd InsertEnter *.json setlocal conceallevel=2 concealcursor=
autocmd InsertLeave *.json setlocal conceallevel=2 concealcursor=

set relativenumber

let g:indentLine_noConcealCursor=""

"Add extra filetypes
let g:tern#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'javascript',
      \ 'js'
      \ ]

autocmd FileType javascript set formatprg=prettier\ --stdin

set fileignorecase
set wildignorecase

set nofoldenable    " disable folding
map <up> <nop>
map <down> <nop>
imap <up> <nop>
imap <down> <nop>
nnoremap <leader><Space> :nohlsearch<Bar>:echo<CR>

set synmaxcol=180

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>ggc :silent! Ggrep -i<Space>
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>

set nocursorline
set lazyredraw

call vimfiler#custom#profile('default', 'context', {
      \ 'explorer' : 1,
      \ 'winwidth' : 35,
      \ 'winminwidth' : 30,
      \ 'toggle' : 1,
      \ 'columns' : 'type',
      \ 'auto_expand': 1,
      \ 'direction' : 'topleft',
      \ 'parent': 0,
      \ 'explorer_columns' : 'type',
      \ 'status' : 1,
      \ 'safe' : 0,
      \ 'split' : 1,
      \ 'hidden': 1,
      \ 'no_quit' : 1,
      \ 'force_hide' : 0,
      \ })

nmap <F8> :TagbarToggle<CR>

