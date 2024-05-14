call plug#begin()
Plug 'mhinz/vim-startify'

"Plug '/usr/bin/fzf'
Plug 'junegunn/fzf',{'dir': '~/.fzf' , 'do':'./install --all'}
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'   "ds (delete)  cs (change) ys (add)
Plug 'brooth/far.vim'
Plug 'easymotion/vim-easymotion'

" Coloscheme
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'

" lang tool
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'python-mode/python-mode'
Plug 'majutsushi/tagbar'	"depend on unitverty/ctags
Plug 'lfv89/vim-interestingwords'
Plug 'tpope/vim-commentary'   "fast commont
Plug 'sbdchd/neoformat'


" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim',{ 'do': ':UpdateRemotePlugins'}
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by using npm
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
call plug#end()

syntax on
colorscheme default

set exrc
set secure 

set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu                    | set nornu | endif
augroup END
set cursorline
set smartindent
set nohlsearch
set incsearch
set listchars=tab:\\t
set list

set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set foldmethod=indent
set foldlevel=99
set foldenable

set formatoptions-=tcq
set splitright
set splitbelow
set showcmd

set ignorecase
set smartcase
set backspace=indent,eol,start,

set scrolloff=5
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set shiftwidth=4
set background=dark
set encoding=utf-8
set updatetime=300
set signcolumn=yes
set ttyfast
set lazyredraw
set visualbell

colorscheme gruvbox
filetype plugin indent on

let mapleader=";"
inoremap <leader><leader> <Esc>

nnoremap <leader>` <Esc>:source ~/.vimrc<cr>
nnoremap <leader>rv :e ~/.vimrc<cr>
nnoremap <leader>dw /\(\<\w\+\>\)\_s*\1

nnoremap <leader>w :w<cr>

nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

let g:ctrlp_map = '<C-p>'
nmap <leader>s <Plug>(easymotion-s2)

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

com! FormatJSON %!python3 -m json.tool

nnoremap <leader>t :TagbarToggle<cr>


let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_doc=1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes','pep8','mccabe','pylint']
let g:pymode_options_max_line_length = 120


let g:neoformat_run_all_formatters = 1
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim =1
let g:neoformat_only_msg_on_error = 1

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

"let g:deoplete#enable_at_startup = 1


" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
