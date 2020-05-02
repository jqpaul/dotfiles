" === VUNDLE PLUGINS === "
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'mhinz/vim-startify'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vimwiki/vimwiki'
call vundle#end()


" === MISC SETTINGS === "
set number relativenumber
set hidden
set mouse=a
set ignorecase
set so=7
set inccommand=split
set splitbelow splitright
filetype plugin on
syntax on


" === COLORSCHEME SETTINGS === "
let g:solarized_termcolors=256
colorscheme solarized
call togglebg#map("<F5>")
highlight clear SignColumn


" === MAPPINGS FOR PLUGINS === "
map <C-n> :NERDTreeToggle<CR>
map <C-a> :Files<CR>


" === MAPPINGS FOR REGULAR USE === "
map Q <nop>
map ' `
map <F9> :e $MYVIMRC<CR>
map <C-x> <ESC>:bn<CR>
map <C-z> <ESC>:bp<CR>
map <C-q> <ESC>:14sp<CR>:ter<CR>
tnoremap <ESC> <C-\><C-n>


" === AUTOCLOSE BRACKETS === "
ino [<CR> [<CR>]<ESC>O
ino {<CR> {<CR>}<ESC>O
ino (<CR> (<CR>)<ESC>O


" === UNMAP ARROW KEYS === "
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>


" === SETTINGS FOR PLUGINS === "
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline#extendiond#tabline#formatter = 'unique_tail'

highlight GitGutterAdd ctermfg=yellow
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
