call plug#begin('~/local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'dag/vim-fish'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'tmsvg/pear-tree'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'for': [ 'typescript', 'javascript', 'html', 'css', 'scss', 'less' ] }
Plug 'ryanoasis/vim-devicons'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-go', { 'do': 'make'}
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
set completeopt-=preview

let mapleader = ','

nmap <leader>w :w!<cr>

" this is experimental bindings
" remove if it doesn't work as it should
" it maps Alt-[9/0] to switch through buffers
nnoremap º :bnext <cr>
nnoremap ª :bprevious <cr>

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

" Use Alt+[j|k] to move lines up or down
" For this to work, Option key should be mapped to Esc+
" source: https://stackoverflow.com/a/15399297/2086073
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

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

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

let g:lightline = {
            \	'colorscheme': 'dracula'
            \}
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]
let g:deoplete#sources#ternjs#docs = 0
let g:deoplete#sources#ternjs#types = 1

" These paths need to be absolute otherwise this wouldn't work
let g:deoplete#sources#rust#racer_binary = '/Users/umayrshahid/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/Users/umayrshahid/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
    au FileType javascript setlocal nofoldenable
augroup END

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1

let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

au FileType go nmap <leader>gr :GoRun<cr>
au FileType go nmap <leader>gt :GoDeclsDir<cr>

au FileType go nmap <F12> <Plug>(go-def)


autocmd FileType vim nnoremap <leader>s :source %<cr>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>

nnoremap <leader>e :Defx -columns=git:icons:filename:type -split=vertical -winwidth=40 -direction=topleft -toggle<cr>
nnoremap <leader>E :Defx -columns=git:icons:filename:type -split=horizontal -winheight=40 -toggle<cr>
nnoremap <leader>d :Defx -columns=git:icons:filename:type<cr>
nnoremap <leader>dt :Defx -columns=git:icons:filename:type -split=tab<cr>

call defx#custom#column('filename', {
	      \ 'directory_icon': '▸',
	      \ 'opened_icon': '▾',
	      \ 'root_icon': ' ',
	      \ 'min_width': 40,
	      \ 'max_width': 40,
	      \ })

	call defx#custom#column('mark', {
	      \ 'readonly_icon': '✗',
	      \ 'selected_icon': '✓',
	      \ })

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction
