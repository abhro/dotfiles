" VIM 8.0 vimrc file

" configure vundle
set nocompatible
filetype off
set shellslash
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'dense-analysis/ale'               " Asynchronous lint engine (LSP)
Plugin 'romainl/Apprentice'               " Dark low-contrast color scheme
Plugin 'jiangmiao/auto-pairs'             " Insert/delete parentheses and brackets in pairs
Plugin 'sjl/badwolf'                      " Dark mode color scheme
Plugin 'wellle/context.vim'               " Show context of current line (sticky scroll)
Plugin 'chrisbra/csv.vim'                 " Support for CSV files
Plugin 'ctrlpvim/ctrlp.vim'               " Full path fuzzy file finder
Plugin 'Mebus/jellybeans.vim'             " Dark mode color scheme
Plugin 'JuliaEditorSupport/julia-vim'     " Vim support for Julia (julialang)
Plugin 'preservim/nerdtree'               " File system explorer
Plugin 'rust-lang/rust.vim'               " Vim support for Rust (rustlang)
Plugin 'keith/swift.vim'                  " Vim support for Swift (Apple)
Plugin 'preservim/tagbar'                 " File outline/tag viewer
Plugin 'tomtom/tlib_vim'                  " Utility for other plugins
Plugin 'kaarmu/typst.vim'                 " Vim support for Typst
Plugin 'vim-airline/vim-airline'          " Lean status/tab-line for vim
Plugin 'acarapetis/vim-colors-github'     " GitHub light mode color scheme for vim
Plugin 'altercation/vim-colors-solarized' " Solarized color scheme for vim
Plugin 'tpope/vim-fugitive'               " Git plugin for vim
Plugin 'airblade/vim-gitgutter'           " Shows git diff in the sign column (gutter)
Plugin 'tikhomirov/vim-glsl'              " Vim support for OpenGL Shading Language
Plugin 'maksimr/vim-jsbeautify'           " Format JavaScript files with js-beautify
Plugin 'vim-latex/vim-latex'              " Enhanced LaTeX support for vim
Plugin 'PProvost/vim-ps1'                 " Vim support for Windows PowerShell
Plugin 'jpo/vim-railscasts-theme'         " Dark mode RailsCasts color scheme
Plugin 'honza/vim-snippets'               " Vim snip-mate default snippets
Plugin 'lervag/vimtex'                    " File type and syntax for (La)TeX files
Plugin 'VundleVim/Vundle.vim'             " Vim plugin manager (Vundle manages itself)
call vundle#end()

behave xterm
filetype plugin indent on
syntax on
set autoread lazyredraw
set incsearch ignorecase hlsearch
set noswapfile
set encoding=utf-8
set fileformats=unix,dos,mac fileformat=unix
set number " show line numbers
set ruler " Always show current position
set magic " For regex turn magic on
set scrolloff=999 " keep cursor centered on screen
set showmatch matchtime=2
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme badwolf
if has("win32")
  set guifont=Consolas:h11
else
  set guifont=Hack\ 14
endif
set guioptions+=ae
set guioptions-=t
set splitright splitbelow
set nobomb
set viminfofile=~/.viminfo " for windows (i really hate _viminfo)
if has('gui_running') | set columns=95 lines=28 | endif

set colorcolumn=80,92,120,+0 textwidth=80
set autoindent smartindent
set expandtab smarttab nojoinspaces
set shiftwidth=4
set softtabstop=4 " number of spaces in tab when editing
set list listchars=tab:>·,trail:·,nbsp:. " for indentation convenience

set wildmenu wildmode=list:longest,full
set wildignore=*.a,*.o,*.pyc,*.pyo,*.git " don't search compiled files

set pastetoggle=<F3> " F3 enters paste mode (solves indenting)

"set clipboard=unnamedplus " use system clipboard

set showcmd " show command in bottom bar
set showmode " show if in insert, visual or replace mode
set cursorline " highlight current line

set ttyfast mouse=a " enable mouse in terminal
set backspace=indent,eol,start

set laststatus=2 " show statusline

set tabpagemax=75 " let there be more than 10 tabs open at once

" control line break / wrapping behavior
set linebreak
set breakat-=.
set breakat-=-
set breakat-=:

" auto save on change of file
"autocmd TextChanged,TextChangedI <buffer> silent write

" make sure that commit messages wrap at 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72

"set foldenable " enable folding
"set foldlevelstart=10 " open most folds by default
"set foldmethod=indent " fold based on indent level

""" keymaps start here

" don't dedent comments
inoremap # X<BS>#

" tab navigation
map <C-Tab>     :tabnext<CR>
map <C-S-Tab>   :tabprevious<CR>
map <C-t>       :tabnew<CR>

" scroll through split windows
nmap <C-h>      :wincmd h<CR>
nmap <C-j>      :wincmd j<CR>
nmap <C-k>      :wincmd k<CR>
nmap <C-l>      :wincmd l<CR>

" cut/copy/paste from and to global buffer
inoremap <C-v>  <C-r>+
vnoremap <C-c>  "+y
vnoremap <C-x>  "+x

" make scrolling through wrapped lines easier
nmap j          gj
nmap k          gk
vmap j          gj
vmap k          gk

" make ^S save
nnoremap <silent> <C-s> :update<CR>
inoremap <silent> <C-s> <Esc>:update<CR>a

autocmd Filetype css,html,json      setlocal softtabstop=2 shiftwidth=2
autocmd Filetype javascript,fortran setlocal softtabstop=2 shiftwidth=2
autocmd Filetype php,ruby,sh,vim    setlocal softtabstop=2 shiftwidth=2
autocmd Filetype text,xhtml,xml     setlocal softtabstop=2 shiftwidth=2

" delete trailing white space on save, useful for python and coffeescript
function! StripTrailingSpace()
  execute "normal mz"
  %substitute/\s\+$//ge
  execute "normal `z"
endfunction
function! StripLeadingSpace()
  execute "normal mz"
  %substitute/^\s\+//ge
  execute "normal `z"
endfunction
function! SrtToVtt() " i like screwing with captions
  call append(0, ["WEBVTT", ""])
  global/^\d\+$/d
  %substitute/\v(\d\d:\d\d:\d\d),(\d\d\d)/\1.\2/g
  set nobomb fileformat=unix fileencoding=utf-8
  call StripTrailingSpace()
  call StripLeadingSpace()
endfunction
autocmd BufWrite *.py     :call StripTrailingSpace()
autocmd BufWrite *.coffee :call StripTrailingSpace()

" see https://vi.stackexchange.com/questions/3455
autocmd BufRead * let &l:modifiable = !&readonly

"""" plugin configurations start here

" NERDtree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$', '\.bak$', '\.pyo$',
                   \'\.o$', '\.a$', '\.so$', '__pycache__', '\.dll$', '\.lib$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <silent> <F2> :NERDTreeToggle<CR>

map <silent> <F12> :TagbarToggle<CR>
let g:tagbar_type_julia = {
      \ 'ctagstype' : 'julia',
      \ 'kinds'     : ['t:struct', 'f:function', 'm:macro', 'c:const']
    \ }

" indent fortran do loops properly
let fortran_do_enddo=1

" make airline have that nice streamline
" needs to have required powerline fonts installed
" works just as well without it
"let g:airline_powerline_fonts=1
