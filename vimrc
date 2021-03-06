" General configuration
set nocompatible              " Don't maintain compatibility with Vi 
set tabstop=2                 " Set tab size to 2
set shiftwidth=2              " Set reindenting size to 2
set expandtab                 " Use spaces instead of tabs
set number                    " Display line numbers
set noswapfile                " Stop creating temporary files
set wildmenu
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'thoughtbot/vim-rspec'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Colour Scheme Settings
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
syntax on
set background=dark
colorscheme vimbrant
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

runtime macros/matchit.vim

if has("autocmd")
 filetype indent plugin on
endif

augroup rubypath
 autocmd!
 autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END

" Key Mappings
nmap 0 ^
nmap <C-s> <esc>:w<CR>
" Navigate up and down through wrapped lines
nmap j gj
nmap k gk

" Insert mappings
imap jk <esc>
imap kj <esc>
imap <C-s> <esc>:w<CR>

" Leader mappings
let mapleader = "\<Space>"

nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
" Edit your vimrc in a new tab
nmap <leader>vi :tabedit ~/.vimrc<cr>
" Pre-populate a split command with the current directory
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
" Edit the db/schema.rb Rails file in a split
nmap <leader>sc :split db/schema.rb<cr>

" Auto Commands
autocmd Filetype help nnoremap <buffer> q :q<CR>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
