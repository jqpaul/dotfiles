call plug#begin('~/.vim/plugged')
Plug 'pearofducks/ansible-vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
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
call plug#end()

call togglebg#map("<F5>")

let g:solarized_termcolors=256
colorscheme solarized

set number relativenumber
set colorcolumn=80
set guifont=Monaco
set mouse=a
set completeopt=noinsert,menuone,noselect

autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * call ncm2#enable_for_buffer()

map <C-n> :NERDTreeToggle<CR>
map gm :call cursor(0, virtcol('$')/2)<CR>

set hidden

ino {<CR> {<CR>}<ESC>O
ino (<CR> (<CR>)<ESC>O
ino [<CR> [<CR>]<ESC>O

map <C-y> <ESC>:bNext<CR>
map <C-x> <ESC>:bprevious<CR>
map <C-a> <ESC>:Files<CR>
map <C-s> <ESC>:w<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
