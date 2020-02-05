set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required
set noshowmode

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" =========================================================================================

" Allows for Remote Plugins like Py3
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'vim-scripts/winmanager' " Window Manager

" Misc Functionality
Plugin 'tpope/vim-fugitive' " Git support
Plugin 'vim-scripts/TaskList.vim' " :TaskList
Plugin 'Shougo/echodoc.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim' " Helps to generate doxygen documentation

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"   " Airline-weather
Plugin 'mattn/webapi-vim'
Plugin 'Wildog/airline-weather.vim'

" NerdTree
Plugin 'scrooloose/nerdtree'

" Language Support / Language Features
Plugin 'shougo/deoplete.nvim'
Plugin 'rstacruz/sparkup' " HTML Support
Plugin 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plugin 'majutsushi/tagbar'
Plugin 'HerringtonDarkholme/yats.vim'
"Plugin 'mhartington/nvim-typescript', {'do': './install.sh'}
Plugin 'fatih/vim-go' "Vim support

" Syntax Themes
Plugin 'semibran/vim-colors-synthetic'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'luochen1990/rainbow'

" TEMPORARY: Vim color switcher
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'

" Keys
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

" Icons
Plugin 'ryanoasis/vim-devicons'

" =========================================================================================
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ========================================================================================

"" Vim Settings
set number
set tabstop=4
set termguicolors
set nowrap
" set term=screen-256color
set guifont=DroidSansMonoPLNerd:h12
set encoding=utf-8
colorscheme calsangr
syntax on
filetype plugin on
set backspace=2


"" Vim Window Pipe
set encoding=utf8
set fillchars=vert:│
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

"" Airline settings
set laststatus=2
let g:weather#area='glasgow,uk'
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

"" NERDTree settings
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

"" TagList settings
let g:tagbar_autofocus = 1

"" Deoplate Settings
"""" Deoplate-Clang
"g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-6.0/lib/libclang-6.0.so.1'
"g:deoplete#sources#clang#clang_header='/usr/lib/llvm-6.0/lib/clang'
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Enable Suggestions
let g:deoplete#enable_at_startup = 1

" Language Client settings
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\ 'c': [
\    '/home/callum/bin/cquery/bin/cquery',
\    '--log-file=/home/callum/.tmp/cq.c.log',
\    '--init={"cacheDirectory":"/home/callum/.tmp/cquery"}'
\  ],
\ 'cpp': [
\    '/home/callum/bin/cquery/bin/cquery',
\    '--log-file=/home/callum/.tmp/cq.cpp.log',
\    '--init={"cacheDirectory":"/home/callum/.tmp/cquery"}' 
\  ] 
\ }

let g:LanguageClient_diagnosticsDisplay = {
    \     1: {
    \         "name": "Error",
    \         "texthl": "ALEError",
    \         "signText": "✖",
    \         "signTexthl": "ALEErrorMsg",
    \     },
    \     2: {
    \         "name": "Warning",
    \         "texthl": "ALEWarning",
    \         "signText": "⚠",
    \         "signTexthl": "ALEWarningSign",
    \     },
    \     3: {
    \         "name": "Information",
    \         "texthl": "ALEInfo",
    \         "signText": "ℹ",
    \         "signTexthl": "ALEInfoSign",
    \     },
    \     4: {
    \         "name": "Hint",
    \         "texthl": "ALEInfo",
    \         "signText": "➤",
    \         "signTexthl": "ALEInfoSign",
    \     },
    \ }

let g:LanguageClient_loadSettings = 1 
let g:LanguageClient_settingsPath = '/home/callum/.config/vim/languageclient.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

"""" DoxygenToolkit

" Remove the brief tag
let g:DoxygenToolkit_briefTag_pre=""


""""""""" KEY MAP CONTROLS 

"" Alt+<ARROW> = Navigate to window
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"" Ctrl+T, <ARROW> = Navigate Tabs
" disabled: Could not get the keybinds to work.
" 			in retrospect, i have no idea what the hell
" 			these are doing...
" 	"nmap <A-t><Up> :tabr<cr>
"	"nmap <A-t><Down> :tabl<cr>
"	"nmap <A-t><Left> :tabp<cr>
"	"nmap <A-t><Right> :tabn<cr>
"" Ctrl+<UP/DOWN> - Next tab, previous tab.
"" 		Mapped as CTRL+UP/DOWN dont do any special character seeking
""		actions.
nmap <silent> <C-Up> :tabnext<CR>
nmap <silent> <C-Down> :tabprevious<CR>

"" Ctrl+K Snippit suggestions
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"" Window resizing
nnoremap <silent> <Leader><Left> :vertical resize -5<CR>
nnoremap <silent> <Leader><Right> :vertical resize +5<CR>
nnoremap <silent> <Leader><Up> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader><Down> :exe "resize " . (winheight(0) * 2/3)<CR>

"" Windows: Function keys to open windows
"F3 - Open Structure Map (tagbar)
"F4 - Language Client: Context
"F5 - Open up to-do list
"F6 - Open up errors (open before tagbar)
nmap <F3> :TagbarToggle<CR>
nmap <F5> :TaskList<CR>
nmap <F6> :copen<CR>


"" Autocomplete deoplete with TAB
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"Open on ctrl+space
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete() 

"Exit on escape
"inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

"" Language Client keys
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F4> :call LanguageClient_contextMenu()<CR>

"" Remap visual {copy+delete} to {delete}, use <leader>+d to cut.
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d


"""""""""" Automatically do stuff(tm)

"" Airline (Remove the trailing information on the right side)
au VimEnter * silent exec "AirlineToggleWhitespace"

"" NERDTree
au VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "Close if nerdtree left

"""""""""" TMUX Colours

"" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

