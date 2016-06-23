set shell=/usr/bin/zsh
filetype off

let &rtp = &rtp . ',' . '/home/kmiasko/nvim_config/bundle/Vundle.vim' . ',' . '/home/kmiasko/nvim_config/snipps'
  call vundle#rc('/home/kmiasko/nvim_config/bundle')

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'SirVer/ultisnips'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-surround'
Plugin 'Markdown'
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'junegunn/vim-easy-align'
Plugin 'rking/ag.vim'
Plugin 'othree/html5.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-vinegar'
Plugin 'dag/vim-fish'
Plugin 'svermeulen/vim-easyclip'
Plugin 'Yggdroot/indentLine'

let g:EasyClipAutoFormat = 1

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-obsession'
Plugin 'nathanaelkane/vim-indent-guides'

" HTML css
Plugin 'mattn/emmet-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'


" JS
" Plugin 'claco/jasmine.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'mxw/vim-jsx'
Plugin 'justinj/vim-react-snippets'
Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'


" Plugin 'digitaltoad/vim-jade'


" magic
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

Plugin 'Shougo/deoplete.nvim'
Plugin 'carlitux/deoplete-ternjs'

let g:tern_request_timeout = 1
let g:deoplete#enable_at_startup = 1

call vundle#end()            " required

set clipboard=unnamed

syntax on
filetype plugin indent on

" common

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let base16colorspace=256  " Access colors present in 256 colorspace

colorscheme base16-ocean
"
" prevent generation of .swp and other gubbins
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

set background=dark
let g:airline_theme='base16_ocean'
let g:airline#extensions#tabline#enabled = 1


if has("gui_running")
    set background=dark
    set guifont=Roboto\ Mono\ 12
endif

" hide the mouse pointer while typing
set mousehide

" set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" display simple options as console text
set guioptions=c

" show/hide current line highlight
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufNewFile,BufRead *.svg set filetype=xml
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .jshintrc set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd BufNewFile,BufRead *.es6 set filetype=javascript


" new

set magic " Set magic on, for regex


" /gui

" key bindings

" set leader to ,
let mapleader = ","

" jump to eol in insert mode with C-]
inoremap <C-]> <End>

" jump to current error with ,l
map <leader>l :ll<CR>

" indent guides
if has("gui_running")
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_color_change_percent = 3
endif

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delitMate_balance_matchpairs = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"

" syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['scss_lint']

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" emmet
let g:user_emmet_leader_key='<C-e>'

" YCM doesn't play nice with emmet, so disable it for html as a workaround
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'unite' : 1,
      \ 'html' : 1,
      \}

let g:UltiSnipsSnippetsDir = "~/vim_config/snipps/"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Easy Align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
map <F5> :NERDTreeToggle<CR>

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

nnoremap <C-left> :vertical resize +5<cr>
nnoremap <C-right> :vertical resize -5<cr>
nnoremap <C-up> :resize +5<cr>
nnoremap <C-down> :resize -5<cr>
nnoremap <silent> <right> :bnext<cr>
nnoremap <silent> <left> :bprev<cr>

let g:used_javascript_libs = 'jquery,react,handlebars,underscore,ramda'
nmap <F8> :TagbarToggle<CR>

let g:syntastic_csslint_args="--ignore=outline-none,box-sizing"
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]


inoremap jk <ESC>

nmap <F9> :SyntasticToggleMode<CR>

let g:airline_powerline_fonts = 1

set expandtab
