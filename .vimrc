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

"""" Reading/Writing
set noswapfile
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
"
"""" Messages, Info, Status
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
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

" ==========================================================
" Shortcuts
" ==========================================================

" Get back to normal mode faster
:inoremap jk <Esc>


"YouCompleteMe stuff
let g:ycm_autoclose_preview_window_after_completion=1

"Enlarge one split window and go back if pushed again
nnoremap W :ZoomWin<CR>

syntax enable
"set background=dark
let g:solarized_termtrans=1
"let g:solarized_contrast = "normal"
"let g:solarized_visibility = "low"
colorscheme solarized

" Nerdtreee addon on the side
let NERDTreeIgnore=['\.pyc$','\.out$', '\.h5', '\~$', '\.ipynb'] "ignore files in NERDTree
map <C-x> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Split navigations
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
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
