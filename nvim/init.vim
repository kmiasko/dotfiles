set shell=/usr/bin/zsh
filetype off

let mapleader = ","

let &rtp = &rtp . ',' . '/home/kmiasko/nvim_config/bundle/Vundle.vim' . ',' . '/home/kmiasko/nvim_config/snipps'
  call vundle#rc('/home/kmiasko/nvim_config/bundle')

set rtp+=~/.fzf

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Libs
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" General code editing
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary.git'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'wellle/targets.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-repeat'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'terryma/vim-expand-region'
Plugin 'sjl/gundo.vim'
Plugin 'justinmk/vim-sneak'

" Linting
Plugin 'neomake/neomake'
Plugin 'benjie/neomake-local-eslint.vim'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" UI
Plugin 'Yggdroot/indentLine'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mhartington/oceanic-next'
Plugin 'Shougo/unite.vim'

let g:oceanic_next_terminal_bold = 1

Plugin 'Konfekt/FastFold'
Plugin 'rbgrouleff/bclose.vim'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'

Plugin 'edkolev/tmuxline.vim'

" Git

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Code search / file search
Plugin 'dyng/ctrlsf.vim'
Plugin 'junegunn/fzf.vim'
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
Plugin 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" HTML css
Plugin 'mattn/emmet-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'othree/html5.vim'
Plugin 'othree/html5-syntax.vim'

" JS
Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'elzr/vim-json'

" Code complete
Plugin 'Shougo/deoplete.nvim'
Plugin 'carlitux/deoplete-ternjs'

" Stuff
Plugin 'metakirby5/codi.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'dag/vim-fish'
Plugin 'svermeulen/vim-easyclip'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-obsession'
Plugin 'junegunn/goyo.vim'

call vundle#end()            " required

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

function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction

function! SearchWithAgInDirectory(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction
command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}
set clipboard=unnamed

syntax on
filetype plugin indent on

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
" if (has("termguicolors"))
"  set termguicolors
" endif

" Theme
syntax enable
set background=dark
colorscheme OceanicNext
" common

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

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


set magic " Set magic on, for regex

" key bindings


" jump to eol in insert mode with C-]
inoremap <C-]> <End>

" jump to current error with ,l
map <leader>l :ll<CR>

" indent guides
if has("gui_running")
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_color_change_percent = 3
endif

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_scss_enabled_makers = ['sasslint']

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

autocmd! BufWritePost * Neomake

" emmet
let g:user_emmet_leader_key='<C-e>'

let g:UltiSnipsSnippetsDir = "~/vim_config/snipps/"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

nnoremap <C-left> :vertical resize +5<cr>
nnoremap <C-right> :vertical resize -5<cr>
nnoremap <C-up> :resize +5<cr>
nnoremap <C-down> :resize -5<cr>
nnoremap <silent> <right> :bnext<cr>
nnoremap <silent> <left> :bprev<cr>

let g:used_javascript_libs = 'jquery,react,handlebars,underscore,ramda'

inoremap jk <ESC>

set expandtab
autocmd InsertEnter *.json setlocal conceallevel=2 concealcursor=
autocmd InsertLeave *.json setlocal conceallevel=2 concealcursor=

set relativenumber

let g:indentLine_noConcealCursor=""
" let g:gruvbox_invert_selection = 0
" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = 'soft'

let tern#is_show_argument_hints_enabled=0
let g:tern_request_timeout=1
let g:tern_show_signature_in_pum=0
let g:deoplete#enable_at_startup=1
let g:tern_show_argument_hints=0

set fileignorecase
set wildignorecase
