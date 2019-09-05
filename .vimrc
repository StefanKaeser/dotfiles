" ==========================================================
" Basic Settings 
" ==========================================================
syntax on                     " syntax highlighing
set number                    " Display line numbers
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set path+=** " :find will now do recursive fuzzy file finding

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc,*.aux

" show a line at column 79
 if exists("&colorcolumn")
    set colorcolumn=79
endif

""" Moving Around/Editing
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set tabstop=4               " <tab> inserts 4 spaces 
set bs=2                    " Allows to use the backspace character

"""" Reading/Writing
set noswapfile
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
"
"""" Messages, Info, Status
set belloff=all             " No ringing or flashing
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set report=0                " : commands always print changed line count.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" ==========================================================
" Remaps 
" ==========================================================
let mapleader = " "         " The leader key is now space

" Move down/up half a screen
nnoremap J <C-D>
nnoremap K <C-U>

" ==========================================================
" Buffer 
" ==========================================================

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <S-l> :bnext<CR>

" Move to the previous buffer
nmap <S-h> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" ==========================================================
" Shortcuts
" ==========================================================

" Get back to normal mode faster
:inoremap jk <Esc>

" === vim-airline=============================================================

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" === vim-airline=============================================================

"Enlarge one split window and go back if pushed again
nnoremap W :ZoomWin<CR>

" === vim-colors-solarized====================================================

syntax enable
set background=dark
let g:solarized_termtrans=1
"let g:solarized_contrast = "normal"
"let g:solarized_visibility = "low"
colorscheme solarized

" === vim-lsp=================================================================

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('texlab')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'texlab',   
        \ 'cmd': {server_info->['texlab']},
        \ 'whitelist': ['bib','tex'],
        \ })
endif

" === asyncomplete============================================================

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" === nerdtree================================================================

" Nerdtreee addon on the side
let NERDTreeIgnore=['\.pyc$','\.out$', '\.h5', '\~$', '\.ipynb'] "ignore files in NERDTree
map <C-x> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Make Tmux understand vim
set term=xterm-256color

" Split navigations
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
" tabs 4 spaces big
set tabstop=4
set softtabstop=4
" autoindentation as big as 4 spaces
set shiftwidth=4
" tab = spaces
set expandtab
" Smart indenting
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"make ww do esc"
inoremap ww <Esc>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" " $/^/w doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap w <nop>

"use UTF-8
set encoding=utf-8

"enable mouse to move coursor
set mouse=a

"copy to clipboard
set clipboard=unnamedplus
