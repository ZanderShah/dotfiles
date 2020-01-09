call plug#begin()

" Visual.
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
" Plug 'ntpeters/vim-better-whitespace'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'skywind3000/asyncrun.vim'

" Language specific.
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/a.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/vim-clang-format'
Plug 'leafgarland/typescript-vim'
Plug 'tikhomirov/vim-glsl'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'lervag/vimtex'

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
set smartindent
set expandtab
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

set completeopt+=preview

" Switch between header and source files.
map <C-a> :A<CR>
let g:alternateExtensions_C='h'
let g:alternateExtensions_h='cpp'

let g:clang_format#auto_format=1

let g:racer_cmd = "/Users/ZanderShah/.cargo/bin/racer"
let g:racer_experimental_completer=1

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

autocmd BufRead,BufNewFile *.py set encoding=prc

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
nnoremap <leader>b :AsyncRun -cwd=<root> make<cr>
noremap <leader>t :call asyncrun#quickfix_toggle(5)<cr>

" School.
autocmd BufWritePost *.md :AsyncRun -cwd=<root> make && ~/force_refresh.sh
autocmd BufWritePost *.tex :AsyncRun -cwd=<root> make

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_max_diagnostics_to_display = 0

nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>je :YcmCompleter GoToReferences<CR>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## cec2e430fee011f8b2ce309b7a446795 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/ZanderShah/.opam/4.07.1/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
