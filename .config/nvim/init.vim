let s:data_dir = $HOME . '/.local/share/nvim'

" === VUNDLE PLUGINS === "
" set rtp+=~/.config/nvim/bundle/Vundle.vim
" call vundle#begin("~/.config/nvim/bundle")
call plug#begin()
" Plugin 'VundleVim/Vundle.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'majutsushi/tagbar'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-obsession'
Plug 'easymotion/vim-easymotion'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'voldikss/vim-floaterm'
Plug 'simeji/winresizer'
Plug 'ryanoasis/vim-devicons'
call plug#end()
" call vundle#end()


" === MISC SETTINGS === "
" Linenumbers
set number
set hidden
" Enable mouse
set mouse=a
set ignorecase
" Space for tabs
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
" Min cursor distance to window edge
set so=5
" Puts a ruler after 75 characters
set colorcolumn=75
" Live document changes on replace
set inccommand=nosplit
" Open new splits 
set splitbelow splitright
set nobackup
set nowritebackup
" Command history
set history=1000
" Disable swap files
set noswapfile
" Height of command bar
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set ssop-=options
filetype plugin indent on
" Syntax highlighting on
syntax on
" Add linux header files to path for 'gf' to open files
let &path.="/lib/modules/5.8.14-arch1-1/build/include"


" === COLORSCHEME SETTINGS === "
set t_Co=256   " This may be needed.
" set background=light
" colorscheme PaperColor

"colorscheme gruvbox
colorscheme preto
"colorscheme PaperColor
call togglebg#map("<F5>")


" === MAPPINGS FOR PLUGINS === "
" Nerdtree
map <C-n> :NERDTreeToggle<CR>
" fzf
map <C-a> :Files<CR>
map <F2> :Files /mnt/jonah/Docs/VimMd/<CR>
map <C-b> :Buffers<CR>
map rg :Rg<CR>
" map <leader>xx :Rg<CR>
" Tagbar
nmap <F11> :TagbarToggle<CR>
" Goyo
map <leader>gg :Goyo<CR>
" Markdown Preview
map <leader>sx :set keymap=kana<CR>
map <leader>sz :set keymap=""<CR>
" nmap <C-m> <Plug>MarkdownPreviewToggle
xmap <Tab> <Plug>(coc-snippets-select)
" WinResizer
let g:winresizer_start_key = '<C-M>'


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
" map <C-q> <ESC>:14sp<CR>:ter<CR>
" tnoremap <ESC> <C-\><C-n>
" tnoremap <C-q> <C-\><C-n>:q<CR>
" Copy and Paste from system clipboard
map <leader>c "+y
map <leader>v "+p
" Stop highlighting after ESC
nnoremap <ESC> <C-c>:noh<CR>
nnoremap <C-c> <ESC>:noh<CR>
nnoremap <Space> <ESC>:Buffers<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" escape on jj, kj, jk
" inoremap jj <esc>
" inoremap kj <esc>
" inoremap jk <esc>

" === LESS RAGE === "
command WQ wq
command Wq wq
command W w
command Q q


" === AUTOCLOSE BRACKETS === "
ino [<CR> [<CR>]<ESC>O
ino {<CR> {<CR>}<ESC>O
" ino (<CR> (<CR>)<ESC>O


" === UNMAP ARROW KEYS === "
map <up> :resize +2<CR>
map <down> :resize -2<CR>
map <left> :vertical resize +2<CR>
map <right> :vertical resize -2<CR>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

imap <ESC> <nop>


" === SETTINGS FOR PLUGINS === "
" CoC
let g:coc_disable_startup_warning = 1
" VimWiki
let g:vimwiki_list = [{
					 \ 'path': '/mnt/jonah/Docs/VimMd',
					 \ 'syntax': 'markdown',
					 \ 'ext': '.md'}]
" Floatterm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F10>'
" Nerdtree
let NERDTreeShowHidden=1
" Status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='atomic'
" let g:airline_theme='tomorrow'
let g:airline#extendiond#tabline#formatter = 'jsformatter'
let g:airline_powerline_fonts = 1
" Snippets
let g:UltiSnipsExpandTrigger="<C-l><C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" SKK
"let g:eskk#directory = s:data_dir . '/skk'
"let g:eskk#dictionary = {
"    \   'path': s:data_dir . '/skk/skk-jisyo.s',
"    \   'sorted': 0,
"    \   'encoding': 'utf-8',
"    \}
"let g:eskk#large_dictionary = {
"    \   'path': s:data_dir . '/skk/SKK-JISYO.L',
"    \   'sorted': 1,
"    \   'encoding': 'euc-jp',
"    \}

" fzf
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark --layout=reverse'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': ':r !echo',
  \ }

" === COC === "
" Close preview window after completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Switch completion on TAB
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
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" if exists('*complete_info')
"  inoremap <expr> <L> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<L>"
"else
"  inoremap <expr> <L> pumvisible() ? "\<C-y>" : "\<C-g>u\<L>"
"endif

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

" Show documentation with K
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

" Highlight all similar symbols
autocmd CursorHold * silent call CocActionAsync('highlight')

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
" autocmd CursorMovedI * if pumvisible() == 0|:call coc#float#close_all()|endif
" autocmd CursorMovedI * if pumvisible() == 0|:call coc#util#float_hide()|endif
" autocmd InsertLeave * if pumvisible() == 0|:call coc#float#close_all()|endif
" autocmd InsertLeave * if pumvisible() == 0|:call coc#util#float_hide()|endif
