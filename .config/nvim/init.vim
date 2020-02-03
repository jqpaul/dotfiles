call plug#begin('~/.vim/plugged')
Plug 'pearofducks/ansible-vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
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
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'maxbrunsfeld/vim-yankstack'
call plug#end()

call togglebg#map("<F5>")

let g:solarized_termcolors=256
colorscheme solarized

set number relativenumber
set colorcolumn=80
set guifont=Monaco
set mouse=a
set completeopt=noinsert,menuone,noselect
set hidden

autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * call ncm2#enable_for_buffer()

map <C-n> :NERDTreeToggle<CR>
map gm :call cursor(0, virtcol('$')/2)<CR>
map <F9> :e $HOME/.config/nvim/init.vim<CR>

ino [<CR> [<CR>]<ESC>O
ino {<CR> {<CR>}<ESC>O
ino (<CR> (<CR>)<ESC>O

map <C-y> <ESC>:bn<CR>
map <C-x> <ESC>:bp<CR>
map <C-a> <ESC>:Files<CR>
map <C-s> <ESC>:w<CR>
map <C-q> <ESC>:ter<CR>

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

imap <C-k> <Plug>(neosnippet_expand_or_jump)

let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['rls']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}
let g:ale_fix_on_save = 1
let g:deoplete#enable_at_startup = 1
