syntax on
syntax enable
set background=dark
" let g:solarized_termcolors=256
if has('gui_running')
  let g:solarized_termcolors=256
else
  let g:solarized_termcolors=16
endif
colorscheme solarized

"Mode change delay
set timeoutlen=1000 ttimeoutlen=50

set encoding=utf-8
set relativenumber
set cursorline " Highlight current line
set showtabline=2 " Always show tab bar.
set noshowmode " Don't show the current mode (airline.vim takes care of us)

"Cursor change with modei
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Scrolling
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.

" Indentation
set autoindent " Copy indent from last line when starting new line.
set shiftwidth=2 " The # of spaces for indenting.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=2 " Tab key results in 2 spaces
set tabstop=2 " Tabs indent only 2 spaces
set expandtab " Expand tabs to spaces


" Splits
set splitbelow " New split goes below
set splitright " New split goes right

" Ctrl-J/K/L/H select split
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Ctrl-arrows select split
nnoremap [1;5B <C-W>j
nnoremap [1;5A <C-W>k
nnoremap [1;5C <C-W>l
nnoremap [1;5D <C-W>h

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" F12: Source .vimrc & .gvimrc files
nmap <F12> :call SourceConfigs()<CR>

if !exists("*SourceConfigs")
  function! SourceConfigs()
    let files = ".vimrc"
    source $MYVIMRC
    if has("gui_running")
      let files .= ", .gvimrc"
      source $MYGVIMRC
    endif
    echom "Sourced " . files
  endfunction
endif



" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"NerdTree
Plug 'scrooloose/nerdtree'

"Color Theme
Plug 'altercation/vim-colors-solarized'

"AirLine
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"AutoCompelete
" Plug 'valloric/youcompleteme'

" GIT
Plug 'tpope/vim-fugitive'

" ACK
Plug 'mileszs/ack.vim'

"A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'

" Commentin
Plug 'tpope/vim-commentary'

" Surroundings
Plug 'tpope/vim-surround'

" ALE (Asynchronous Lint Engine)
Plug 'w0rp/ale'

" Ansible syntax highlight
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; python2 generate.py', 'branch': 'v2' }


" Initialize plugin system
call plug#end()

" Nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMouseMode = 2
let NERDTreeMinimalUI = 0
map <C-n> :NERDTreeToggle %<CR>

let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
