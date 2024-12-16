" Configuration de base
set nocompatible
filetype plugin indent on
syntax on

" Numéros de ligne
set number
set relativenumber

" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab

" Recherche
set hlsearch
set incsearch
set ignorecase
set smartcase

" Interface
set showcmd
set showmatch
set wildmenu
set laststatus=2

" Performances
set lazyredraw

" Sauvegarde automatique
set autowrite
set autowriteall

" Définir updatetime à 1 ms (attention : cela peut être très intensif)
set updatetime=1

" Groupe d'autocommandes pour la sauvegarde automatique
augroup AutoSave
  autocmd!
  " Sauvegarder après chaque modification en mode normal et insertion
  autocmd TextChanged,TextChangedI <buffer> silent! update
  " Sauvegarder lorsque vous quittez le mode insertion
  autocmd InsertLeave <buffer> silent! update
  " Sauvegarder toutes les 1 ms d'inactivité en mode normal et insertion
  autocmd CursorHold,CursorHoldI <buffer> silent! update
augroup END

" Désactiver la création de fichiers de sauvegarde et d'échange
set nobackup
set nowritebackup
set noswapfile

" Activer la souris
set mouse=a

" Encodage
set encoding=utf-8


" Activer le pliage de code
set foldenable
set foldmethod=indent
set foldlevelstart=10

" Mappage de touches
let mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Activer le collage intelligent
set pastetoggle=<F2>

set virtualedit=onemore

" auto close pairs
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'lambdalisue/fern.vim'
Plug 'preservim/nerdtree'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'
call plug#end()
let g:fern_disable_startup_warnings = 1
filetype plugin on

let g:NERDTreeShowIcons = 0

" Open NERDTree automatically when Vim starts without a file
"autocmd vimenter * NERDTree | wincmd p
" Toggle NERDTree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>
" Specific settings for YAML files
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 noexpandtab

" Transparency for any colorscheme
augroup transparent_background
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight Folded ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
augroup END

" Key mappings for switching colorschemes
map <F8> :NextColorScheme<CR>
map <S-F8> :PrevColorScheme<CR>

" Optional: if you want random colorscheme
map <F7> :RandomColorScheme<CR>

" Hada houwa: my favorite theme
colorscheme nord


" Enable bold font
let g:enable_bold_font = 1

" Enable powerline/nerd fonts
set encoding=UTF-8

let g:airline_powerline_fonts = 1
set guifont=Hack\ Nerd\ Font:h12
