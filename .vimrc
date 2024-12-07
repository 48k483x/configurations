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
set expandtab

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

set whichwrap-=h
set whichwrap-=l

" Add this to your ~/.vim_runtime/my_configs.vim

" Enable smooth scrolling
set smoothscroll

" Configure scroll-off margin
set scrolloff=8

" Configure cursor movement speed
set ttyfast
set lazyredraw

" Set updatetime for smoother updates (lower value = smoother, but more CPU usage)
set updatetime=100

" If you're using Neovim, you can also add:
if has('nvim')
    " Enable cursor animation
    set mousescroll=ver:1,hor:1
endif
