""" Setup Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" file browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" search anything
Plugin 'kien/ctrlp.vim'
" git
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'dense-analysis/ale'


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required


call plug#begin()
Plug 'kkoomen/vim-doge'
call plug#end()

""" Indent
filetype plugin indent on    " required
setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8

set path+=**
""" Split Layouts

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" Code Folding

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with /
" nnoremap / za
" Docstring folded code
let g:SimpylFold_docstring_preview=1

""" python indentation
" au bufnewfile,bufread *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

" color white unnecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" utf-8
set encoding=utf-8

""" Syntax Checking/Highlighting
let python_highlight_all=1
syntax on

""" Color Schemes
let g:solarized_termcolors=256

syntax enable
set background=dark
colorscheme solarized


" Solarized switch light/dark theme
call togglebg#map("<F5>")

""" Line Numbering
set nu

""" System Clipboard
set clipboard=unnamed

""""" Keybinds
let mapleader = ","
" Quick Saving
nmap <leader>w :w!<cr>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
"nmap <Leader>qq :qa!<CR>

" NERDTree
map <F7> :NERDTreeToggle<CR>
nnoremap <Leader>nn :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

" Tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Map <Space> to / (search) and <Ctrl>+<Space> to ? (backwards search):

map <space> /
map <C-space> ?
map <silent> <leader><cr> :noh<cr>

" Closing of the current buffer(s) (<leader>bd and (<leader>ba)):

" Close current buffer
map <leader>bd :Bclose<cr>

" Close all buffers
map <leader>ba :1,1000 bd!<cr>

" Syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = {
"     \ 'mode': 'passive',
"     \ 'active_filetypes': ["python"],
"     \ 'passive_filetypes': []
" \}
" nnoremap <Leader>s :SyntasticCheck<CR>
" nnoremap <Leader>r :SyntasticReset<CR>
" nnoremap <Leader>i :SyntasticInfo<CR>
" nnoremap <Leader>m :SyntasticToggleMode<CR>
" show lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" Open ack.vim for fast search:

map <leader>g :Ack

" Cope mappings:

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Quickly insert parenthesis/brackets/etc.:

inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" vim-snipmate mappings to autocomplete via snippets:

ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>

" vim-surround mappings to easily surround a string with _() gettext annotation:

vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" docs snippet

let g:snips_author = 'Ambroise Renaud'
let g:snips_email = 'ambroise.renaud@gmail.com'
let g:snips_github = 'ambroisernd'
let g:doge_doc_standard_python = 'numpy'

" Ale
" Check Python files with flake8 and pylint.
let b:ale_linters = {'python': ['mypy', 'flake8', 'pylint']}
" Fix Python files with black and isort.
let b:ale_fixers = {'python': ['black', 'isort']}
" TODO: pip install black

let g:ale_completion_enabled = 1
nnoremap <Leader>s :ALEFix<CR>
nnoremap <Leader>f :ALEGoToDefinition<CR>
nnoremap <Leader>i :ALEFindReferences<CR>
nnoremap <Leader>m :SyntasticToggleMode<CR>

