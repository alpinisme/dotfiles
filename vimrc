if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" color themes 
Plug 'KKPMW/distilled-vim'
Plug 'tjammer/blayu.vim'
Plug 'dracula/vim', { 'as': 'dracula' } 
Plug 'arcticicestudio/nord-vim'
Plug 'marcopaganini/termschool-vim-theme'
Plug 'cocopon/iceberg.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'AhmedAbdulrahman/aylin.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'fenetikm/falcon'

Plug 'junegunn/fzf'
Plug 'itchyny/lightline.vim'    "status bar at bottom
Plug 'andys8/vim-elm-syntax'    "elm syntax highlight
Plug 'janko/vim-test'           "testing
Plug 'neoclide/coc.nvim', {'branch': 'release'} "for language-server-protocol
Plug 'tpope/vim-commentary'     "toggle comments 
Plug 'tpope/vim-surround'       "surround with stuff like quotes, braces, and tags
Plug 'mattn/emmet-vim'          "emmet integration `<C-y>,`
Plug 'tpope/vim-fugitive'       "git integration (command `:Git <command>`
Plug 'scrooloose/nerdtree'      "navigate directories and files
Plug 'airblade/vim-gitgutter'   "shows git diff next to line numbers: add, remove, change

Plug 'rust-lang/rust.vim'
call plug#end()

syntax on           "turn on syntax highlighting

let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set termguicolors   "allow true color (not 16/256 color) themes to display properly
colorscheme blayu

set number          "show line numbers
set laststatus=2    "show status bar at bottom
set autoindent      "indent automatically on return
filetype plugin indent on 
set expandtab       "use spaces on tab
set shiftwidth=4    "number of spaces per tab (for autoindent)
set softtabstop=4   "number of spaces per tab
set cursorline      "highlight line with cursor
set incsearch       "search as you type
set hlsearch        "highlight search terms
set path+=**        "enable recursive file search with `:find` 
set wildmenu        "show menu of options when tabbing through
set visualbell      "flash when do something wrong (like moving past end of line) instead of yelling
set showcmd         "Show incomplete cmds down the bottom
set backspace=indent,eol,start  "Allow backspace in insert mode
set scrolloff=8     "Start scrolling when we're 8 lines away from margins
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set lazyredraw      "Don’t update screen during macro and script execution.
set linebreak       "don't wrap words midway through
set foldmethod=syntax "fold (`z-a`) according to code syntax
set nofoldenable    "disable automatic folding on file opening
set foldlevel=99
" keybindings
map <C-n> :NERDTreeToggle<CR>
inoremap <C-@> <ESC> 
nnoremap zz :update<CR>
inoremap zz <Esc>:update<CR>gi
vnoremap y "*y
nnoremap <C-p> "*p
tnoremap <Esc> <C-\><C-n>       "return to normal mode from terminal mode using escape key
" Map <leader> to `,`
let mapleader=','

nmap <silent> <leader>t :TestFile<CR>

" recommended CoC config
set hidden
"inoremap <silent><expr> <c-space> coc#refresh()
set updatetime=300  
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Keybindings
nmap <leader>r <Plug>(coc-rename)
nmap <silent> <leader>s <Plug>(coc-fix-current)
nmap <silent> <leader>S <Plug>(coc-codeaction)
nmap <silent> <leader>a <Plug>(coc-diagnostic-next)
nmap <silent> <leader>A <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>g :call CocAction('doHover')<CR>
nmap <silent> <leader>u <Plug>(coc-references)
nmap <silent> <leader>p :call CocActionAsync('format')<CR>
nmap <silent> <leader>f :call CocActionAsync('format')<CR>
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
