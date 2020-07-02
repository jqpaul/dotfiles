" === VUNDLE PLUGINS === "
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'mhinz/vim-startify'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vimwiki/vimwiki'
Plugin 'majutsushi/tagbar'
Plugin 'sbdchd/neoformat'
Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-obsession'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'sirver/UltiSnips'
Plugin 'honza/vim-snippets'
Plugin 'vifm/vifm.vim'
call vundle#end()


" === MISC SETTINGS === "
" Linenumbers
set number relativenumber
set hidden
" Enable mouse
set mouse=a
set ignorecase
" Space for tabs
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
" Min cursor distance to window edge
set so=7
" Live document changes on replace
set inccommand=nosplit
" Open new splits 
set splitbelow splitright
set nobackup
set nowritebackup
" Command history
set history=1000
" Height of command bar
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set ssop-=options
filetype plugin indent on
syntax on


" === COLORSCHEME SETTINGS === "
colorscheme gruvbox
" colorscheme preto
call togglebg#map("<F5>")


" === MAPPINGS FOR PLUGINS === "
" Nerdtree
map <C-n> :NERDTreeToggle<CR>
" fzf
map <C-a> :Files<CR>
map <C-b> :Buffers<CR>
map rg :Rg<CR>
" Code formatter
map <C-S-f> :Neoformat<CR>
" Tagbar
nmap <F8> :TagbarToggle<CR>


" === MAPPINGS FOR REGULAR USE === "
map Q <nop>
map ' `
" Open vim config
map <F12> :e $MYVIMRC<CR>
" Buffer navigation
map <C-x> <ESC>:bn<CR>
map <C-z> <ESC>:bp<CR>
map <C-g> <ESC>:bd!<CR>
" Bindings for terminal opening and closing
map <C-q> <ESC>:14sp<CR>:ter<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap <C-q> <C-\><C-n>:q<CR>
" Copy and Paste from system clipboard
map <leader>c "+y
map <leader>v "+p
" Stop highlighting after ESC
nnoremap <ESC> :noh<CR>


" === LESS RAGE === "
command WQ wq
command Wq wq
command W w
command Q q


" === AUTOCLOSE BRACKETS === "
ino [<CR> [<CR>]<ESC>O
ino {<CR> {<CR>}<ESC>O
ino (<CR> (<CR>)<ESC>O


" === UNMAP ARROW KEYS === "
map <up> :resize +2<CR>
map <down> :resize -2<CR>
map <left> :vertical resize +2<CR>
map <right> :vertical resize -2<CR>


" === SETTINGS FOR PLUGINS === "
" VimWiki
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/'}]
					 "\ 'syntax': 'markdown',
					 "\ 'ext': '.md'}]
" Nerdtree
let NERDTreeShowHidden=1
" Status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline#extendiond#tabline#formatter = 'jsformatter'
" Snippets
let g:UltiSnipsExpandTrigger="<C-l>"

" fzf
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark --layout=reverse'


" === COC === "
" Close preview window after completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Completion on TAB
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Completion with Control-Space
inoremap <silent><expr> <c-space> coc#refresh()

" Comfirm completion with ENTER
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GOTO Mapping
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>oi :CocCommand java.action.organizeImports<CR>
nmap <leader>aa :CocAction<CR>
nmap <leader>[d <Plug>(coc-diagnostic-prev)
nmap <leader>]d <Plug>(coc-diagnostic-next)

nnoremap <leader>dd  :<C-u>CocList diagnostics<cr>

" Show Documentation WITH K
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight all similar symbols
autocmd CursorHold * silent call CocActionAsync('highlight')

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|:call coc#util#float_hide()|endif
autocmd InsertLeave * if pumvisible() == 0|:call coc#util#float_hide()|endif
