" Initialise {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/local/share/nvim/plugged/gocode/vim/symlink.sh' }
Plug 'rhysd/committia.vim'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'shougo/vimfiler.vim'
Plug 'shougo/unite.vim'
Plug 'shougo/denite.nvim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'timonv/vim-cargo'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'yegappan/mru'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-clang'
" Enable the two lines below to enable python autocomplete with deoplete
" Plug 'davidhalter/jedi-vim'
" Plug 'zchee/deoplete-jedi'
call plug#end()
"}}}

" General {{{

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Use relative line numbers - uncomment the following code to use relative line numbers
" if exists("&relativenumber")
"    set relativenumber
"    au BufReadPost * set relativenumber
" endif

"}}}

" VIM Interface {{{
" Remove preview buffer from auto complete options
set completeopt-=preview

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
if !has('nvim')
    set esckeys
endif

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Don’t add empty newlines at the end of files
set binary
set noeol

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set tabstop=2

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Always show status line
set laststatus=2

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Hide the current mode
set noshowmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Remove the vertical split character
set fillchars=vert:\ 

"}}}

" Colors and Fonts {{{

" Enable syntax highlighting
syntax enable 

try
    "colorscheme solarized 
    " TODO: remove solarized
    colorscheme dracula
    " TODO: make the lines below conditional
    highlight FoldColumn guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE cterm=bold
    " Colors for Selection Menu
    highlight Pmenu ctermfg=NONE ctermbg=NONE
    highlight PmenuSel ctermfg=232 ctermbg=84 cterm=NONE
    highlight PmenuSBar ctermbg=NONE
    highlight PmenuThumb ctermbg=84

catch
endtry

"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
" without BOM.
set encoding=utf8 nobomb

" Use Unix as the standard file type
set ffs=unix,dos,mac

"}}}

" Files, Backups and Undo {{{

" Remove the following lines to turn backup off, 
" since most stuff is in SVN, git et.c anyway...

" set nobackup
" set nowb
" set noswapfile

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

"}}}

" Text, Tab and Indent Related {{{

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"}}}

" Visual Mode Related {{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"}}}

" Movement, Tabs, Windows & Buffers {{{

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
"      \   exe "normal! g`\"" |
"      \ endif
" Remember info about open buffers on close
" set viminfo^=%

"}}}

" Status line {{{

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"}}}

" Editing Mappings {{{

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"}}}

" Spell Checking {{{

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"}}}

" Misc {{{

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"}}}

" Helper Functions {{{

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"}}}

" Plugins {{{
" vim-go {{{
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
au FileType go nmap <leader>gd :GoDoc<cr>
au FileType go nmap <leader>gt :GoTest<cr>
au FileType go nmap <leader>rr :GoRename<cr>
au FileType go nmap <leader>gk :GoKeyify<cr>
au FileType go nmap <leader>d :GoDeclsDir<cr>
au FileType go nmap g] :GoDef<cr>
au FileType go nmap g[ :GoDefPop<cr>

au FileType go nmap <F12> <Plug>(go-def)
au FileType go nmap <F11> <Plug>(go-def-pop)
"}}}

" vim-cargo {{{
au FileType rust nmap <leader>cr :CargoRun<cr>
au FileType rust nmap <leader>cb :CargoBuild<cr>
au FileType rust nmap <leader>cc :CargoClean<cr>
au FileType rust nmap <leader>cu :CargoUpdate<cr>
" }}}

" rust.vim {{{
let g:rustfmt_autosave = 1
au FileType rust nmap <leader>rf :RustFmt<cr>
" }}}

" airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'dracula'
" let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1

"}}}

" MRU {{{
let MRU_Max_Entries = 400
map <leader>m :MRU<CR>

"}}}

" ALE {{{
" TODO: 
"   - add ALE fixers
"   - provide linters instead of using them all
"   - add leader mappings
"   - get a life

"}}}

" git-gutter {{{
let g:gitgutter_enabled=0
nnoremap <silent> <leader>gg :GitGutterToggle<cr>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

let g:gitgutter_sign_added = '●'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '●'
let g:gitgutter_sign_removed_first_line = '○'
let g:gitgutter_sign_modified_removed = '○'

"}}}

" Denite {{{
map <leader>b :Denite -buffer-name=buffer buffer<cr>
map <leader>l :Denite -buffer-name=line -auto-highlight line<cr>
map <leader>c :Denite -buffer-name=command command<cr>
map <leader>h :Denite -buffer-name=history command_history<cr>
map <leader>p :Denite -buffer-name=file file<cr>
map <leader>r :Denite -buffer-name=file_rec file_rec<cr>

map <C-p> :Denite -buffer-name=file file<cr>

call denite#custom#map(
            \ 'insert',
            \ '<Down>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<Up>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
" Minor nitpick:
" cursorline overides the ctermfg for deniteMatchedChar, makes it look a bit ugly.
highlight deniteMatchedChar cterm=bold ctermbg=NONE ctermfg=141
"}}}

" vimfiler {{{
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'
if has('mac')
    let g:vimfiler_quick_look_command = 'qlmanage -P'
else
    let g:vimfiler_quick_look_command = 'gloobus-preview'
endif
let g:vimfiler_ignore_pattern =
            \ '^\%(\.git\|\.idea\|\.DS_Store\|\.vagrant\|.stversions'
            \ .'\|node_modules\|.*\.pyc\)$'

nnoremap <Leader>f :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>

"}}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 50

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:deoplete#sources#rust#racer_binary = $HOME.'/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = $RUST_SRC_PATH
let g:deoplete#sources#rust#disable_keymap=1

let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/4.0.1/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/4.0.1/lib/clang/'

au FileType rust nmap <leader>gd <Plug>DeopleteRustGoToDefinitionDefault
au FileType rust nmap <leader>d <Plug>DeopleteRustShowDocumentation

" supertab mappings
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

" Enable auto selection
set completeopt+=noinsert
" }}}

"}}}
" vim:foldmethod=marker:foldlevel=0