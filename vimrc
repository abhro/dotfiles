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

behave xterm                    " Behave like Xterm for mouse and selection
filetype plugin indent on
set autoread                    " If file changed outside vim, reload automatically
set lazyredraw                  " Don't redraw while executing macros and commands
set incsearch                   " Highlight matches as search pattern is typed
set ignorecase                  " Case-insensitive search
set hlsearch                    " Highlight matches of previous search
set noswapfile                  " Don't use a swapfile for buffers
set encoding=utf-8              " Character encoding used inside Vim
set fileformats=unix,dos,mac    " EOL formats to try when editing a new buffer
set fileformat=unix             " EOL format for current buffer
set number                      " Show line numbers
set ruler                       " Always show current position
set magic                       " For regex, turn magic on
set scrolloff=999               " Keep cursor centered on screen
set showmatch                   " When a bracket is inserted, briefly jump to the matching one
set matchtime=2                 " 1/10 s to show the matching paren for showmatch
set t_Co=256                    " Number of colors in terminal
let g:solarized_termcolors=256

set background=light
colorscheme badwolf

" Set font for GUI windows
if has("win32")
  set guifont=Consolas:h11
else
  set guifont=Hack\ 14
endif
set guioptions+=a               " Turn on auto-select in visual mode
set guioptions+=e               " Add tab pages when indicated with showtabline
set guioptions+=k               " Keep window size
set guioptions-=t               " Don't let menus be tear-off
set guioptions-=T               " Turn off toolbar
set splitright                  " Splitting vertically puts new window on the right
set nobomb                      " Don't write a BOM (byte-order-mark) for files
set viminfofile=~/.viminfo      " Set name of viminfo file
if has('gui_running') 
  set columns=95 lines=28
endif

set colorcolumn=80,92,120,+0    " Highlight the screen column at these values
set textwidth=80                " Maximum width of text that is being inserted
set autoindent                  " Copy indent from current line when starting a new line
set smartindent                 " Do smart auto-indenting when starting a new line
set expandtab                   " Replace tabs with spaces
set smarttab                    " Use shiftwidth for number of spaces per tab
set nojoinspaces                " Single space after a full stop
set shiftwidth=4                " Number of spaces to use for each step of (auto)indent.
set softtabstop=4               " Number of spaces in tab when editing
set list                        " Highlight whitespace
set listchars=tab:>·,trail:·,nbsp:. " Spec for highlighting whitespace

set wildmenu
set wildmode=list:longest,full
set wildignore=*.a,*.o,*.pyc,*.pyo,*.git " Don't search compiled files

set pastetoggle=<F3>            " F3 enters paste mode (solves indenting)

"set clipboard=unnamedplus      " Use system clipboard

set showcmd                     " Show command in bottom bar
set showmode                    " Show if in insert, visual or replace mode
set cursorline                  " Highlight current line

set ttyfast                     " Assume fast terminal
set mouse=a                     " Enable mouse in terminal
set backspace=indent,eol,start

set laststatus=2                " Show statusline
set tabpagemax=75               " Maximum number of tabs open at once

" control line break / wrapping behavior
set linebreak                   " Do a visual wrap at 'breakat' character
set breakat-=.
set breakat-=-
set breakat-=:

" auto save on change of file
"autocmd TextChanged,TextChangedI <buffer> silent write

" make sure that commit messages wrap at 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72

set foldenable                      " Enable folding
set foldlevelstart=10               " Open most folds by default
"set foldmethod=indent              " fold based on indent level

""" keymaps start here

" Don't dedent comments
inoremap    #           X<BS>#

" Tab navigation
map         <C-Tab>     :tabnext<CR>
map         <C-S-Tab>   :tabprevious<CR>
map         <C-t>       :tabnew<CR>

" Scroll through split windows
nmap        <C-h>       :wincmd h<CR>
nmap        <C-j>       :wincmd j<CR>
nmap        <C-k>       :wincmd k<CR>
nmap        <C-l>       :wincmd l<CR>

" Cut/copy/paste from and to global buffer using Ctrl-X/Ctrl-C/Ctrl-V
inoremap    <C-v>       <C-r>+
vnoremap    <C-c>       "+y
vnoremap    <C-x>       "+x

" Make scrolling through wrapped lines easier
nmap        j           gj
nmap        k           gk
vmap        j           gj
vmap        k           gk

" Make ^S save
nnoremap    <silent> <C-s> :update<CR>
inoremap    <silent> <C-s> <Esc>:update<CR>a

autocmd Filetype css,html,json      setlocal softtabstop=2 shiftwidth=2
autocmd Filetype javascript,fortran setlocal softtabstop=2 shiftwidth=2
autocmd Filetype php,ruby,sh,vim    setlocal softtabstop=2 shiftwidth=2
autocmd Filetype text,xhtml,xml     setlocal softtabstop=2 shiftwidth=2

" Delete trailing white space on save, useful for python and coffeescript
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

" If file is read-only, turn off 'modifiable'.
" See https://vi.stackexchange.com/questions/3455
autocmd BufRead * let &l:modifiable = !&readonly

"""" plugin configurations start here

" NERDtree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$', '\.bak$', '\.pyo$',
                   \'\.o$', '\.a$', '\.so$', '__pycache__', '\.dll$', '\.lib$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <silent> <F2> :NERDTreeToggle<CR>

" Tagbar configuration
map <silent> <F12> :TagbarToggle<CR>
let g:tagbar_type_julia = {
      \ 'ctagstype' : 'julia',
      \ 'kinds'     : ['t:struct', 'f:function', 'm:macro', 'c:const']
    \ }

let fortran_do_enddo=1          " Indent Fortran do loops properly

" make airline have that nice streamline
" needs to have required powerline fonts installed
" works just as well without it
"let g:airline_powerline_fonts=1
