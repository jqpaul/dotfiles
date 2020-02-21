call plug#begin('~/.vim/plugged')
Plug 'pearofducks/ansible-vim'
Plug 'preservim/nerdtree'
Plug 'w0rp/ale'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-neosnippet'
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }
Plug 'junegunn/fzf.vim'
Plug 'cespare/vim-toml'
Plug 'altercation/vim-colors-solarized'
Plug 'rust-lang/rust.vim'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
call plug#end()

call togglebg#map("<F5>")

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%{strftime("%c")}'
let g:solarized_termcolors=256
colorscheme solarized

set number relativenumber
set colorcolumn=80
set guifont=Monaco
set mouse=a
set completeopt=noinsert,menuone,noselect
set hidden
set nocompatible
set ignorecase
set so=7
filetype plugin on
syntax on

autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * call ncm2#enable_for_buffer()

map <C-n> :NERDTreeToggle<CR>
map <F9> :e $MYVIMRC<CR>
map Q <Nop>
map ' `

nmap <F8> :TagbarToggle<CR>

map <C-x> <ESC>:bn<CR>
map <C-z> <ESC>:bp<CR>

ino [<CR> [<CR>]<ESC>O
ino {<CR> {<CR>}<ESC>O
ino (<CR> (<CR>)<ESC>O

map <C-q> <ESC>:ter<CR>
map <C-m> <ESC>:ALEGoToDefinition<CR>

nnoremap <C-a> <ESC>:Files<CR>
inoremap <C-a> <ESC>0i
inoremap <C-d> <ESC>$a

nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

tnoremap <Esc> <C-\><C-n>

noremap + :s/^/\/\//<CR>
noremap - :s/^\/\///<CR>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

imap <C-Space> <Plug>(neosnippet_expand_or_jump)
smap <C-Space> <Plug>(neosnippet_expand_or_jump)

let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['rls']}
let g:ale_fixers = {
			\   '*': ['remove_trailing_lines', 'trim_whitespace'],
			\   'rust': ['rustfmt'],
			\}
let g:ale_fix_on_save = 1
let g:deoplete#enable_at_startup = 1

let g:LanguageClient_diagnosticsSignsMax = 0
" let g:LanguageClient_serverCommands =  {'rust': ['rls'],}

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
