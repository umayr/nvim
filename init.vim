call plug#begin('~/local/share/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-unimpaired'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'editorconfig/editorconfig-vim'
Plug 'zchee/deoplete-jedi'

call plug#end()

set autoread
set number
set history=500
set backspace=indent,start,eol
set clipboard=unnamed
set cursorline
set noerrorbells
set title
set encoding=utf8 nobomb
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=400
set ai
set si
set wrap

let mapleader = ','

nmap <leader>w :w!<cr>

nnoremap <Tab> :tabnext<cr>
nnoremap <S-Tab> :tabprev<cr>

map <Space> /
map <S-Space> ?
map <silent> <leader><cr> :noh<cr>

map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l

map j gj
map k gk

nnoremap <Left> :vertical resize -1<cr>
nnoremap <Right> :vertical resize +1<cr>
nnoremap <Up> :resize -1<cr>
nnoremap <Down> :resize +1<cr>

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

hi! link Sneak Search

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:fzf_layout = { 'down': '~30%' }
nnoremap <leader>f :<C-u>Files<cr>
nnoremap <leader>b :<C-u>Buffers<cr>
nnoremap <leader>l :<C-u>BLines<cr>
nnoremap <leader>i :<C-u>Lines<cr>
nnoremap <leader>o :<C-u>Windows<cr>
nnoremap <leader>y :<C-u>History<cr>
nnoremap <leader>h :<C-u>History:<cr>
nnoremap <leader>c :<C-u>Commands<cr>
nnoremap <leader>m :<C-u>Maps<cr>

set termguicolors
syntax on
color dracula

set noshowmode

let g:lightline = {
            \	'colorscheme': 'Dracula'
            \}
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]

