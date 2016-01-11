set shell=/usr/bin/zsh
set nocompatible
filetype off

set encoding=utf8

set rtp+=~/vim_config/bundle/Vundle.vim
set rtp+=/home/kmiasko/vim_config/snipps

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'mhinz/vim-startify'
Plugin 'SirVer/ultisnips'
Plugin 'chriskempson/base16-vim'

Plugin 'tpope/vim-surround'
Plugin 'Markdown'
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'airblade/vim-gitgutter'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'junegunn/vim-easy-align'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'othree/html5.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" HTML css
Plugin 'mattn/emmet-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'

" JS
Plugin 'claco/jasmine.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'

" Node
Plugin 'moll/vim-node'

" React
Plugin 'mxw/vim-jsx'
Plugin 'justinj/vim-react-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'


Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'digitaltoad/vim-jade'


" magic
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

Plugin 'jasoncodes/ctrlp-modified.vim'
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>
Plugin 'scrooloose/nerdtree'

Plugin 'tacahiroy/ctrlp-funky'

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


Plugin 'ryanoasis/vim-devicons'
call vundle#end()            " required

set clipboard=unnamed

syntax on
filetype plugin indent on

" common

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-solarized
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
set t_Co=256
" let g:airline_theme='solarized-dark'
let g:airline#extensions#tabline#enabled = 1


if has("gui_running")
    set background=dark
    " set guifont=PragmataPro\ 11
	" set guifont=Fira\ Mono\ 11
	" set guifont=Inconsolata\ 12
  set guifont=Fura\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Octicons\ Plus\ Pomicons\ 11
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

" /gui

" key bindings

" set leader to ,
let mapleader = ","

" jump to eol in insert mode with C-]
inoremap <C-]> <End>

" jump to current error with ,l
map <leader>l :ll<CR>

" ctrlp
" let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" let g:ctrlp_custom_ignore = {
"  \  'dir':  '\v[\/]\.(git|hg|svn)$',
"  \  'file': '\v\.(exe|so|dll|git)$',
"  \  'link': 'some_bad_symbolic_links',
"  \ }
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_dotfiles = 1
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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
let g:syntastic_less_use_less_lint = 1
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = ['eslint']

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

autocmd FileType javascript setlocal omnifunc=tern#Complete

let g:used_javascript_libs = 'underscore,jquery,angularjs,requirejs'
nmap <F8> :TagbarToggle<CR>

let g:syntastic_csslint_args="--ignore=outline-none,box-sizing"
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]


inoremap jk <ESC>

nmap <F9> :SyntasticToggleMode<CR>

let g:airline_powerline_fonts = 1

set expandtab
