set rtp+=/usr/local/opt/fzf

call plug#begin()

" Visual.
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'ntpeters/vim-better-whitespace'

Plug 'junegunn/fzf.vim'
Plug 'skywind3000/asyncrun.vim'

" Language specific.
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/a.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/vim-clang-format'
" Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

runtime plugin/a.vim
nunmap <leader>ih
nunmap <leader>is
nunmap <leader>ihn

" Colors.
syntax enable
set background=dark
colorscheme base16-ocean
let base16colorspace=256
set termguicolors
let g:lightline={'colorscheme': 'seoul256'}

" Spaces and tabs.
set expandtab
set autoindent
set backspace=indent,eol,start
set smarttab
set shiftwidth=4
set softtabstop=4

" UI settings.
set number
set nowrap
set showcmd
set showmatch
set laststatus=2
set scrolloff=3

" Search.
set incsearch
set hlsearch
set ignorecase
set smartcase

" General settings.
set nocompatible
filetype plugin indent on
set nobackup
set hidden
set history=50
set encoding=utf-8
set autowrite

set completeopt-=preview

" Switch between header and source files.
map <C-a> :A<CR>
let g:alternateExtensions_C='h'
let g:alternateExtensions_h='cpp'

let g:clang_format#auto_format=1

let g:racer_cmd = "/Users/ZanderShah/.cargo/bin/racer"
let g:racer_experimental_completer=1

let mapleader=" "
map ; :

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>

" Pane switching.
nnoremap <leader>v :vs<cr>
nnoremap <leader>l <C-W>l
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>h <C-W>h

" FZF.
nnoremap <leader>f :Files<cr>

" AsyncRun.
let g:asyncrun_rootmarks = ['.git']
" School notes.
au BufWritePost *.md :AsyncRun -cwd=<root> "./build_notes.sh"
nnoremap <leader>b :AsyncRun -cwd=<root> make<cr>
noremap <leader>t :call asyncrun#quickfix_toggle(5)<cr>
