set nocompatible
filetype off

" Fuzzy file finder
set rtp+=/usr/local/opt/fzf


" Vim-Plug
filetype plugin indent on
filetype plugin on


call plug#begin('~/.local/share/nvim/plugged')

" LANGUAGES
" -Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" -Javascript
Plug 'pangloss/vim-javascript'

" - Dockerfile "
Plug 'ekalinin/Dockerfile.vim'

" MISC
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" AUTOCOMPLETE
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" THEMES
" -Editor Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elliotcourant/material.vim'

" EDITOR
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

" Required
Plug 'mileszs/ack.vim'
Plug 'vim-syntastic/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'qpkorr/vim-bufkill'

call plug#end()

" All Key Bindings "
let mapleader = "'"
nnoremap <Leader><Up>    :resize +10<CR>
nnoremap <Leader><Down>  :resize -10<CR>
nnoremap <Leader><Left>  :vertical resize +10<CR>
nnoremap <Leader><Right> :vertical resize -10<CR>
nmap <Leader>d :bd<CR>     " Close buffer without closing split
nmap <Tab> <C-w>
nmap <Tab><Tab> <C-w><C-w> " Cycle focus of splits on double-tab
command! WQ wq
command! Wq wq
command! Qa qa
command! QA qa
command! W w
command! Q q
command! D call deoplete#toggle()
command! VS vs
command! Vs vs
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nmap <Leader>z :echo cfi#format("%s", "")<CR>

if &diff
    au BufLeave <buffer> :qa
endif

function! SetPhpOptions()
    set tags=tags-php;
    let g:fzf_tags_command = 'ctags-php -o tags-php -R --fields=+laimS --languages=php .'

    inoremap jjtr \DebugLogger::trace();<Left><Left>
    inoremap jjma \DebugLogger::mark();<Left><Left>
    inoremap jjlo \DebugLogger::log("");<Left><Left><Left>
    inoremap jjdu \DebugLogger::log(<esc>p$a);
    inoremap jjsh \DebugLogger::shallow(<esc>p$a);
    nnoremap gd :call phpactor#GotoDefinition()<CR>
    nnoremap mm :call phpactor#ContextMenu()<cr>
endfunction

function! SetJsOptions()
    set tags=tags-js;
    let g:fzf_tags_command = 'ctags -o tags-js --languages=javascript -R .'
endfunction

" Easy Align Keybindings "
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Easy Motion Keybindings "
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)
map <Leader>q <Plug>(easymotion-bd-jk)
nmap <Leader>Q <Plug>(easymotion-overwin-line)
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"" Nerd Tree Keybindings "
nmap <Leader>n :NERDTreeToggle<CR>

" FZF Keybindings "
" nmap <Leader>t :Tags<CR>
nmap <Leader>f :Files<CR>
noremap <c-\> :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>

nmap <Leader>T :GoDecls<CR>

" Ag Keybindings "
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap ; :Buffers<CR>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-y>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
call coc#config('coc.preferences', {
            \    'noselect': 'false',
            \ })

" SETTINGS
set number
set expandtab ts=4 sw=4 ai
set bs=2
set laststatus=2
set clipboard+=unnamedplus
set autoread    " Update buffer when file is modified externally.
set showcmd     " I want to see the command keys
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set hidden
set nowrap
set go+=b.
set mouse=a

" Stray javascript setting? "
let g:used_javascript_libs = 'underscore,backbone,mustache,jquery'

let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_echo_command_info = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_test_show_name = 1
let g:go_addtags_transform = "snakecase"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tagbar#enabled = 0

" set completeopt-=preview
set completeopt=menu,noinsert
autocmd CompleteDone * silent! pclose!

" Vim theme settings. "
let g:airline_theme = 'material'
let g:material_theme_style = 'dark'
set background=dark
colorscheme material

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Fuzzy File Finder "
set rtp+=/usr/local/opt/fzf
set rtp+=/.fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

source ~/.config/nvim/crlogictest.vim
autocmd BufEnter */sql/logictest/testdata/* set filetype=crlogictest tw=0

