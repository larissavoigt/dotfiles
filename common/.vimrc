runtime bundle/vim-pathogen/autoload/pathogen.vim " Load Pathogen from bundle
call pathogen#infect()            " Pathogen start

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.
filetype plugin on

" Set Unicode
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif"

:let mapleader = ","              " Map leader to , (ABNT2 Keyboard)

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set relativenumber                " Show relative line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.
set noerrorbells                  " No beeping.

set clipboard=unnamed             " Share system clipboard.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set nofoldenable                  " Disable folding

" Indentation Settings
set tabstop=2                    " Global tab width.
set softtabstop=2                " Global softtab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=%{fugitive#statusline()}\ [%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Xoria256 Color Theme
colorscheme xoria256

" 80 column highlight
set colorcolumn=81
highlight ColorColumn ctermbg=235

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Swap colon and semicolon for easier commands
nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;

" Map to open files in the same directory as the current file
noremap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

" Indent Tabs configuration
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=233
autocmd VimEnter * :IndentGuidesEnable

" Highligh json as javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

" Auto open QuickFix
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Fast saving
nmap <leader>w :w<cr>

" Sudo save
cmap w!! w !sudo tee % >/dev/null

" FuzzyFinder
nnoremap <silent> <leader>f :FufFile **/<CR>
hi Pmenu ctermfg=255
hi Pmenu ctermbg=233

" Switch between absolute and relative numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Toggle Spellcheck
nnoremap <silent> <leader>ss :setlocal spell!<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Insert ; at the end of the line
inoremap ;; <End>;<Esc>

" Settings for erlang files
" Tabs with 4 spaces
" Fold comments automatically
autocmd FileType erlang
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set foldmethod=expr |
      \ set foldexpr=getline(v:lnum)=~'^\\s*%' |
      \ exec "normal zM``"

" Auto lintfy files
" let g:jshint2_save = 1
" let g:jshint2_read = 1

let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#fnamecollapse=1
let g:airline#extensions#tabline#show_tab_type=0
let g:airline_section_c=""
let g:airline_section_x=""
let g:airline_section_y=""
let g:airline_section_z=""
let g:airline_left_sep=''
let g:airline_right_sep=''

" Auto make C++ files on save
autocmd BufWritePost,FileWritePost *.cpp silent make! | redraw!

" Vim Go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>v <Plug>(go-vet)