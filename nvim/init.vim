" ==================================================================================================================================
"
" <(✝)>< :: DOTFILES > vimrc
" Duncan K. DeVore / @ironfish
"
" ==================================================================================================================================
set shell=/bin/sh

" PLUG#BEGIN (plugin manager begin) {{
" ==================================================================================================================================
" NOTE: https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/tpope/vim-fugitive'                       " run git commands
Plug 'https://github.com/airblade/vim-gitgutter'                   " show git diff in gutter
Plug 'https://github.com/rking/ag.vim'                             " for fast searching (ag text-search --scala)
Plug 'https://github.com/junegunn/vim-easy-align'                  " for easy alignment
Plug 'https://github.com/godlygeek/tabular'                        " for alignment and filtering
Plug 'https://github.com/tpope/vim-surround'                       " surround with brackets, quotes, etc.
Plug 'https://github.com/tyru/caw.vim'                             " for commenting code
Plug 'https://github.com/terryma/vim-multiple-cursors'             " multiple cursor select
Plug 'https://github.com/Shougo/deoplete.nvim'                     " awesome completion
Plug 'https://github.com/rizzatti/dash.vim'                        " OSX only - requires dash installation
Plug 'https://github.com/Raimondi/delimitMate'                     " autocompletion for parens, brackets, etc.
Plug 'https://github.com/itspriddle/vim-marked'                    " markdown - requires tabular to load first
Plug 'https://github.com/plasticboy/vim-markdown'                  " awesome markdown tool
Plug 'https://github.com/derekwyatt/vim-scala'                     " scala support
Plug 'https://github.com/ironfish/scala-api-complete'              " my wip for scala completion
Plug 'artur-shaik/vim-javacomplete2'                               " better java complete
Plug 'https://github.com/vim-jp/vim-java'                          " better java syntax
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'                                        " much better than the native search highlighting
Plug 'https://github.com/chriskempson/base16-vim'                  " imho, best color schemes around
Plug 'https://github.com/NLKNguyen/papercolor-theme'               " even better color scheme
Plug 'https://github.com/mhartington/oceanic-next'
Plug 'https://github.com/nanotech/jellybeans.vim'
Plug 'https://github.com/itchyny/lightline.vim'                    " super awesome status line
Plug 'https://github.com/ap/vim-buftabline'                        " displays buffers in the tabline
Plug 'https://github.com/Yggdroot/indentLine'                      " indents as a thin vertical line.
Plug 'https://github.com/junegunn/rainbow_parentheses.vim'         " nested colored paranthesis
Plug 'justinmk/vim-dirvish'
Plug 'ludovicchabant/vim-gutentags'                                " auto-generate tags"
Plug 'https://github.com/majutsushi/tagbar'                        " list functions and symbols
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
call plug#end()
" ==================================================================================================================================
" }}

" MAPPINGS {{
" ==================================================================================================================================
"KEYM ------------------------------------------------------------------------------------------------------------------------------
"KEYM editor mappings
"KEYM ------------------------------------------------------------------------------------------------------------------------------
"KEYM | space                      |    n, v | leader
let mapleader="\<space>"
" use timeoutlen between mapped key press
set timeout
" timeout length to wait in millis
set timeoutlen=200

"KEYM | <leader>a                  |    n    | search dash for cursor word
nmap <silent> <leader>a <Plug>DashSearch

"KEYM | <leader>b OR 0             | i, n, v | go to beginning of line insert mode
imap <leader>b <esc>0
nnoremap <leader>b 0
vnoremap <leader>b 0

"KEYM | <leader>c                  |    n, v | comment normal mode
nmap <leader>c <Plug>(caw:I:toggle)
vmap <leader>c <Plug>(caw:I:toggle)

"KEYM | <leader>d                  |    n    | delete current buffer
nnoremap <leader>d :bd<CR>

"KEYM | <leader>e OR $             | i, n, v | go to end of line
imap <leader>e <esc>$
nnoremap <leader>e $
vnoremap <leader>e $

"KEYM | <leader>f OR za            |    n    | toggle fold
nnoremap <leader>f za

"KEYM | <leader>hh                 |    n    | toggle highlight
nnoremap <leader>hh :noh<cr>

"KEYM | <leader>i                  |    n    | toggle invisibles
nnoremap <leader>i :set list!<CR>

"KEYM | <leader>m                  |    n    | show key mappings
nnoremap <silent> <Leader>m :call ShowMaps()<CR>

"KEYM | <leader>n                  |    n    | toggle number/relative number
nnoremap <leader>n :call ToggleNumber()<CR>

"KEYM | <leader>r                  |    n    | toggle rainbow
nnoremap <leader>r :RainbowParentheses!!<CR>

"KEYM | <leader>s                  |    n    | set spell check
map <leader>s :setlocal spell!<cr>

"KEYM | <leader>t                  |    n    | toggle tagbar
nnoremap <leader>t :TagbarToggle<CR>

"KEYM | <leader>v                  |    n    | reload init.vim
nnoremap <leader>v :source $MYVIMRC<CR>

"KEYM | <leader>w                  |    n    | save
nnoremap <leader>w :w!<cr>

"KEYM | -                          |    n    | open dirvish (explorer) window.
nnoremap <silent> - :Dirvish %:p:h<cr>

"KEYM | ;                          |    n    | use ; for commands.
nnoremap ; :

"KEYM | Tab                        |    n, v | jump between split pairs normal mode
nnoremap <tab> %
vnoremap <tab> %

" set working directory to the current buffer's directory
"KEYM | cd OR cD                   |    n    | set working directory to current buffer
nnoremap cd :lcd %:p:h<bar>pwd<cr>
nnoremap cD :cd %:p:h<bar>pwd<cr>

"KEYM | cu OR cU                   |    n    | set working directory up one level from current buffer
nnoremap cu :lcd ..<bar>pwd<cr>
nnoremap cU :cd ..<bar>pwd<cr>

"KEYM | u                          |    n    | undo
"KEYM | U                          |    n    | ctrl-r sucks for redo, us U instead
noremap U <C-R>

"KEYM | Ctrl-]                     |    n    | tags jump to definition
nnoremap <C-]> g<C-]>

"KEYM | Tab       OR Ctrl-j        | i       | move up in autocomplete
inoremap <expr> <c-j> ("\<C-n>")

"KEYM | Shift+Tab OR Ctrl-k        | i       | move down in autocomplete
inoremap <expr> <c-k> ("\<C-p>")
"KEYM ------------------------------------------------------------------------------------------------------------------------------
"KEYM easyalign mappings
"KEYM ------------------------------------------------------------------------------------------------------------------------------
"KEYM | Enter                      |       v | start interactive easyalign visual mode
vmap <Enter> <Plug>(EasyAlign)

"KEYM | ga                         |    n    | start easyalign in normal
nmap ga <Plug>(EasyAlign)
"KEYM ----------------------------------------------------------------------------------------------------------------------------------
"KEYM multi_cursor mappings
"KEYM ----------------------------------------------------------------------------------------------------------------------------------
"NOTE VISUAL MODE:
"  1. ctrl-n will select the word(s) and place you in VISUAL mode
"  2. 'h','j','k' and 'l' will allow you to change the selection block
"  3. 'c' or 's' will delete the selected word(s) and enter INSERT mode
"NOTE NORMAL MODE:
"  1. use 'v' to enter normal mode
"  2. 'i' will insert at the cursor(s) current location
"  3. 'I' will move the cursor to the beginning of the line for insertion
"  4. 'a' will move the cursor to the end of the word for insertion
"  5. 'A' will move the cursor to the end of the line for insertion
" move cursor down/up within non-breaking lines
nnoremap j gj
nnoremap k gk
noremap <Up> gk
noremap <Down> gj
inoremap <Down> <C-o>gj
inoremap <Up>   <C-o>gk
"KEYM | h, j, k, l                 |       v | to change slection
"KEYM | c, s                       |       v | to delete
"KEYM | i                          | i       | insert at cursor

"KEYM | Ctrl+n                     |    n    | select word/next under cursor
let g:multi_cursor_next_key='<C-n>'

"KEYM | Ctrl-m                     |    n    | select previous word
let g:multi_cursor_prev_key='<C-m>'

"KEYM | Ctrl-x                     |    n    | skip word
let g:multi_cursor_skip_key='<C-x>'

"KEYM | Esc                        |    n    | quit multi select
let g:multi_cursor_quit_key='<Esc>'
"KEYM ----------------------------------------------------------------------------------------------------------------------------------
"KEYM fzf mappings
"KEYM ----------------------------------------------------------------------------------------------------------------------------------
"KEYM | Ctrl-f                     |    n    | fzf files search
nnoremap <silent> <leader><leader> :Files<CR>
nnoremap <silent> <c-f> :Files<CR>

"KEYM | Ctrl-b                     |    n    | fzf buffers search
nnoremap <silent> <leader><leader>b :Buffers<CR>
nnoremap <silent> <c-b> :Buffers<CR>

"KEYM | Ctrl-l                     |    n    | fzf lines in buffer
nnoremap <silent> <leader><leader>l :BLines<CR>
nnoremap <silent> <c-l> :BLines<CR>

"KEYM | Ctrl-t                     |    n    | fzf tags in buffer search
nnoremap <silent> <leader><leader>t :BTags<CR>
nnoremap <silent> <c-t> :BTags<CR>
"KEYM ----------------------------------------------------------------------------------------------------------------------------------
"KEYM neovim terminal and window split mappings
"KEYM ----------------------------------------------------------------------------------------------------------------------------------
"KEYM | <leader>h                  |    n    | navigate left to terminal/window
tnoremap <leader>h <c-\><c-n>:call TermInsert("h")<cr>
nnoremap <leader>h :call TermInsert("h")<cr>
"KEYM | <leader>l                  |    n    | navigate right to terminal/window
tnoremap <leader>l <c-\><c-n>:call TermInsert("l")<cr>
nnoremap <leader>l :call TermInsert("l")<cr>

"KEYM | <leader>j                  |    n    | navigate down to terminal/window
tnoremap <leader>j <c-\><c-n>:call TermInsert("j")<cr>
nnoremap <leader>j :call TermInsert("j")<cr>

"KEYM | <leader>k                  |    n    | navigate up to terminal/window
tnoremap <leader>k <c-\><c-n>:call TermInsert("k")<cr>
nnoremap <leader>k :call TermInsert("k")<cr>

"KEYM | <leader>/                  |    n    | neovim vertical window split
nnoremap <leader>/ <C-w>v

"KEYM | <leader>-                  |    n    | neovim horizontal window split
nnoremap <leader>- <C-w>s

"KEYM | <leader>//                 |    n    | neovim vertical terminal split
nnoremap <silent> <leader>// :vsp term://fish \| startinsert<CR>

"KEYM | <leader>--                 |    n    | neovim horizontal terminal split
nnoremap <silent> <leader>-- :sp term://fish \| startinsert<CR>
"KEYM ----------------------------------------------------------------------------------------------------------------------------------
"KEYM git mappings
"KEYM ----------------------------------------------------------------------------------------------------------------------------------
"KEYM | <leader>gd                 |    n    | git diff
nnoremap <leader>gd :Gdiff<CR>

"KEYM | <leader>gg                 |    n    | toggle gitgutter
nnoremap <leader>gg :GitGutterToggle<CR>

"KEYM | <leader>gs                 |    n    | git status
nmap <leader>gs :Gstatus<CR>gg<c-n>

" show keymappings
function! ShowMaps()
  :! ag --nocolor --nonumbers 'KEYM' $MYVIMRC | sed -E 's/^(( )*)?(.*)/\3/'
endfunction

" force neovim terminal to enter insert mode
function! TermInsert(direction)
  stopinsert
  execute "wincmd" a:direction
  if &buftype == 'terminal'
    startinsert!
  endif
endfunction

" toggle relative line numbers
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction
" ==================================================================================================================================
" }}

" DEFAULTS {{
" ==================================================================================================================================
" ----------------------------------------------------------------------------------------------------------------------------------
" appearance
" ----------------------------------------------------------------------------------------------------------------------------------
" enable true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" change curser shape in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" enable syntax
syntax enable

" color scheme
colorscheme papercolor

" important for dark schemes
"set background=dark

" increase the left margin by 1
set colorcolumn=+1

" highlight current line
set cursorline

" show vertical line
set cursorcolumn

" show the status line
set laststatus=2

" redraw only when needed
set lazyredraw

" list characters
set listchars+=tab:›\ "
set listchars+=trail:·
set listchars+=nbsp:␣
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=eol:¶"

" highlight matching tags
set matchpairs=(:),[:],{:},<:>

" hide show mode in status line, using lightline plugin, not needed
set noshowmode

" keep the cursor on the same column
set nostartofline

" show line numbers
set number

" show the line and column number of the cursor
set ruler

" keep cursor 8 lines from top and bottom when page scrolls
set scrolloff=8

" show partial command in the last line of the screen
set showcmd
" ----------------------------------------------------------------------------------------------------------------------------------
" behavior
" ----------------------------------------------------------------------------------------------------------------------------------
" notify when file has changed outside of vim/nvim
set autoread

" write on exit
set autowriteall

" backspace over auto-indent, eol, start to join lines
set backspace=indent,eol,start

" use system clipboard
set clipboard=unnamed

" hide buffers when abandoned, will allow movement to another without saving
set hidden

" remember some stuff
set history=100

" enable mouse
set mouse=a

" turn off error bells
set noerrorbells

" turn off visual bell
set novisualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" default horizontal split is below
set splitbelow

" default vertical split is to the right
set splitright

" ctrl-v to select text in block mode
if has('virtualedit')
  " let me move cursor anywhere in buffer
  set virtualedit+=block
endif

" make cursor keys wrap (] and \ are for right and left arrows
set whichwrap=h,l,[<]>],[<\>]

" tags location
set tags=./tags;/
" ----------------------------------------------------------------------------------------------------------------------------------
" folding
" ----------------------------------------------------------------------------------------------------------------------------------
" open all the highest level folds
set foldlevel=0

" open most folds by default
set foldlevelstart=10

" default fold marker
set foldmarker={{,}}

" default fold method
set foldmethod=marker

" maximum number of nested folds
set foldnestmax=10

" do not fold on start
set nofoldenable
" ----------------------------------------------------------------------------------------------------------------------------------
" formatting
" ----------------------------------------------------------------------------------------------------------------------------------
" continue comments by default
set formatoptions+=r

" make comment when using o or O from comment line
set formatoptions+=o

" format comments with gq
set formatoptions+=q

" recognize numbered lists
set formatoptions+=n

" format comments
set formatoptions+=c

" wrap when using textwidth
set formatoptions+=t

" wrap long lines at a character
set linebreak

" don't join lines with two spaces at the end of sentences
set nojoinspaces

" do not show whitespace characters on start
set nolist

" line break character for wrapped lines
set showbreak=↪

" scrolling can be very slow for long wraps (i.e. columns)
set synmaxcol=132

" no hard breaks unless i press enter
set textwidth=0

" wrap text at window width
set wrap
" ----------------------------------------------------------------------------------------------------------------------------------
" indents
" ----------------------------------------------------------------------------------------------------------------------------------
" copy indent from current line
set autoindent

" number of spaces to use for indent
set shiftwidth=2

" smart auto-indenting when starting a new line
set smartindent
" ----------------------------------------------------------------------------------------------------------------------------------
" menus
" ----------------------------------------------------------------------------------------------------------------------------------
" show the whole tag, not just the function name
set showfulltag

" things to ignore
set wildignore+=tags

" set menu for tab key
set wildmenu

" complete only up to the point of ambiguity
set wildmode=list:longest,full
" ----------------------------------------------------------------------------------------------------------------------------------
" search
" ----------------------------------------------------------------------------------------------------------------------------------
" NOTE: type / followed by ctrl-f to open search history window
" clear the last search results on loading of file
let @/ = ""

" highlight search results
set hlsearch

" incremental highlight as search is typed
set incsearch

" set search to ignore case
set ignorecase

" case sensitive search when given caps
set smartcase

" set search to wrap lines
set wrapscan
" ----------------------------------------------------------------------------------------------------------------------------------
" spelling
" ----------------------------------------------------------------------------------------------------------------------------------
" trun on tab completion for spelling
set complete+=kspell

" unix/osx dictionary
set dictionary+=/usr/share/dict/words

" spelling whitelist
set spellfile=$HOME/.nvim/spell/en.utf8.add

" spelling language
set spelllang=en_us
" ----------------------------------------------------------------------------------------------------------------------------------
" tabs vs spaces
" ----------------------------------------------------------------------------------------------------------------------------------
" replace tabs with spaces
set expandtab

" when on, a <Tab> in fron of a line inserts blanks
set smarttab

" use 2 spaces, interpret tab as indent
set softtabstop=2

" set tab width
set tabstop=2
" ----------------------------------------------------------------------------------------------------------------------------------
" directories
" ----------------------------------------------------------------------------------------------------------------------------------
" backup file
set backup
" backup directory
set backupdir=~/dotfiles/tmp/nvim-backup//
" backup before overwriting original file
set writebackup
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

" swap directory
set directory=~/dotfiles/tmp/nvim-swap//
" don't warn when there is existing swap file
set shortmess+=A
" time in millis until next swap file is written
set updatetime=500
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" undo directory
set undodir=~/dotfiles/tmp/nvim-undo//
" returns name of undo file
set undofile
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif

" view directory
set viewdir=~/dotfiles/tmp/nvim-view//
if !isdirectory(expand(&viewdir))
  call mkdir(expand(&viewdir), "p")
endif

if !has('nvim')
  set viminfo='1000,n~/dotfiles/tmp/viminfo
else
  set viminfo='1000,n~/dotfiles/tmp/nviminfo
endif
" ==================================================================================================================================
" }}

" FILE-TYPES {{
" ==================================================================================================================================
" ----------------------------------------------------------------------------------------------------------------------------------
" dirvish
" ----------------------------------------------------------------------------------------------------------------------------------
augroup my_dirvish_event
  autocmd!
  autocmd FileType dirvish call fugitive#detect(@%)
augroup END
" ----------------------------------------------------------------------------------------------------------------------------------
" java
" ----------------------------------------------------------------------------------------------------------------------------------
let g:JavaComplete_MavenRepositoryDisable = 1
let g:java_highlight_functions="style"
augroup filetype_java
  autocmd!
  autocmd BufNewFile,BufRead *.java set filetype=java
  autocmd FileType java setlocal shiftwidth=4
  autocmd FileType java setlocal tabstop=4
  autocmd FileType java setlocal softtabstop=4
  autocmd FileType java setlocal expandtab
  autocmd FileType java setlocal foldmethod=indent
  autocmd FileType java setlocal foldlevel=1
  autocmd FileType java setlocal foldlevelstart=10
  autocmd FileType java setlocal foldnestmax=10
  autocmd FileType java setlocal nofoldenable
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
" ----------------------------------------------------------------------------------------------------------------------------------
" html
" ----------------------------------------------------------------------------------------------------------------------------------
augroup filetype_html
  autocmd!
  autocmd FileType html setlocal shiftwidth=4
  autocmd FileType html setlocal tabstop=4
  autocmd FileType html setlocal softtabstop=4
  autocmd FileType html setlocal expandtab
augroup END
" ----------------------------------------------------------------------------------------------------------------------------------
" python
" ----------------------------------------------------------------------------------------------------------------------------------
augroup filetype_python
  autocmd!
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal expandtab
augroup END
" ----------------------------------------------------------------------------------------------------------------------------------
" scala
" ----------------------------------------------------------------------------------------------------------------------------------
augroup filetype_scala
  autocmd!
  autocmd BufNewFile,BufRead *.scala set filetype=scala
  autocmd FileType scala, RainbowParentheses
  autocmd FileType scala setlocal shiftwidth=2
  autocmd FileType scala setlocal tabstop=2
  autocmd FileType scala setlocal softtabstop=2
  autocmd FileType scala setlocal expandtab
  autocmd FileType scala setlocal foldmethod=indent
  autocmd FileType scala setlocal foldlevel=1
  autocmd FileType scala setlocal foldlevelstart=10
  autocmd FileType scala setlocal foldnestmax=10
  autocmd FileType scala setlocal nofoldenable
""  autocmd FileType scala setlocal omnifunc=scalaapi#complete
augroup END
" ==================================================================================================================================
" }}

" PLUGINS {{
" ==================================================================================================================================
" ----------------------------------------------------------------------------------------------------------------------------------
" buftabline
" ----------------------------------------------------------------------------------------------------------------------------------
" buffer's state is indicated in the buffer label
let g:buftabline_indicators=1

" always show buffer tabline
let g:buftabline_show=2

" the buffer number is shown in the buffer label
let g:buftabline_numbers=1

" draw thin vertical line between buffer tabs
let g:buftabline_separators=1
" ----------------------------------------------------------------------------------------------------------------------------------
" deocomplete
" ----------------------------------------------------------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

" <TAB>: completion.
imap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#mappings#close_popup() . "\<CR>"
endfunction
" ----------------------------------------------------------------------------------------------------------------------------------
" dirvish
" ----------------------------------------------------------------------------------------------------------------------------------
let g:dirvish_hijack_netrw = 1
" ----------------------------------------------------------------------------------------------------------------------------------
" fzf
" ----------------------------------------------------------------------------------------------------------------------------------
" display finder info inline with query
if has('nvim')
  let $FZF_DEFAULT_COMMAND='ag -l -g ""'
  let $FZF_DEFAULT_OPTS=' --inline-info'
endif

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" ----------------------------------------------------------------------------------------------------------------------------------
" gitgutter
" ----------------------------------------------------------------------------------------------------------------------------------
" disable gutter when gitgutter disabled
let g:gitgutter_sign_column_always=0

" enable at start
let g:gitgutter_enabled=1

" max signs
let g:gitgutter_max_signs=1000

" heavy greek cross
let g:gitgutter_sign_added="\u271a"

" heavy rounded-tip rightwards arrow
let g:gitgutter_sign_modified="\u279c"

" heavy ballot X
let g:gitgutter_sign_removed="\u2718"

" medium right facing triangle
let g:gitgutter_sign_modified_removed="►"

" enable signs by default
let g:gitgutter_signs=1

" enable line highlights
let g:gitgutter_highlight_lines=0

" gitgutter will use Sign Column to set its color, reload it
call gitgutter#highlight#define_highlights()
" ----------------------------------------------------------------------------------------------------------------------------------
" indentline
" ----------------------------------------------------------------------------------------------------------------------------------
let g:indentLine_concealcursor=""
let g:indentLine_leadingSpaceChar="\u00b7"
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_color_gui = '#eeeeee'
" ----------------------------------------------------------------------------------------------------------------------------------
" lightline
" ----------------------------------------------------------------------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'PaperColor',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'gitgutter', 'fugitive', 'filename' ] ],
  \   'right': [ [ 'trailing', 'indentation', 'lineinfo' ], [ 'tags', 'percent' ], [ 'fileformat', 'fileencoding', 'filetype'] ]
  \ },
  \ 'component_function': {
  \   'gitgutter': 'MyGitGutter',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'lineinfo': 'MyLineinfo',
  \   'tags': 'MyGutenTags',
  \   'fileformat': 'MyFileformat',
  \   'fileencoding': 'MyFileencoding',
  \   'filetype': 'MyFiletype',
  \ },
  \ 'component_expand': {
  \   'trailing': 'TrailingSpaceWarning',
  \   'indentation': 'MixedIndentSpaceWarning',
  \ },
  \ 'component_type': {
  \   'trailing': 'warning',
  \   'indentation': 'warining',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': "\u2502", 'right': "\u2502" }
  \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? "\ue0a2" : ''
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = "\uf126"  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark . ' ' . _ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyLineinfo()
  return printf("\uf0cb %3d:%-2d", line('.'), col('.'))
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? "\uf15c" . ' ' . &filetype : 'no ft') : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  let path = expand('%:F')
  return fname == '__Tagbar__' ? '' :
    \ fname =~ 'NERD_tree' ? '' :
    \ &ft == 'dirvish' ? path :
    \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ ('' != fname ? fname : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
    \ || ! get(g:, 'gitgutter_enabled', 0)
    \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
    \ g:gitgutter_sign_added . ' ',
    \ g:gitgutter_sign_modified . ' ',
    \ g:gitgutter_sign_removed . ' '
    \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

function! MyGutenTags()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*gutentags#statusline')
      let mark = "\uf02b"  " edit here for cool mark
      let _ = gutentags#statusline('....')
      return strlen(_) ? mark . ' ' . _ : mark
    endif
  catch
  endtry
  return ''
endfunction

" credit to https://github.com/obxhdx/vimfiles/blob/master/lightline.vim
function! TrailingSpaceWarning()
  if winwidth(0) < 80
    return ''
  endif
  let trailing = search('\s$', 'nw')
  if trailing != 0
    return '… trailing[' . trailing . ']'
  else
    return ''
  endif
endfunction

function! MixedIndentSpaceWarning()
  if winwidth(0) < 80
    return ''
  endif
  let tabs = search('^\t', 'nw')
  let spaces = search('^ ', 'nw')
  if (tabs != 0) && (spaces != 0)
    return '» mixed-indent[' . tabs . ']'
  else
    return ''
  endif
endfunction

augroup ComponentExpand
  autocmd!
  autocmd CursorHold,BufWritePost,InsertLeave * call s:flags()
augroup END

function! s:flags()
  if exists('#LightLine')
    call TrailingSpaceWarning()
    call MixedIndentSpaceWarning()
    call MyGutenTags()
    call lightline#update()
  endif
endfunction
" ----------------------------------------------------------------------------------------------------------------------------------
" multi_cursor
" ----------------------------------------------------------------------------------------------------------------------------------
let g:multi_cursor_use_default_mapping=0
" ----------------------------------------------------------------------------------------------------------------------------------
" neomake
" ----------------------------------------------------------------------------------------------------------------------------------
"let g:neomake_open_list = 0 " Disable cursor stealing.
"let g:neomake_scala_enabled_makers = ['scalastyle']
"let g:neomake_python_enabled_makers = ['pep8', 'flake8']
"let g:neomake_python_pep8_maker = {
"  \ 'args': ['--max-line-length 99'],
"  \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"  \ }
"autocmd! BufWritePost,BufReadPost * Neomake
" ----------------------------------------------------------------------------------------------------------------------------------
" neovim terminal
" ----------------------------------------------------------------------------------------------------------------------------------
if exists(':terminal')
  " allow terminal buffer size to be very large
  let g:terminal_scrollback_buffer_size = 100000
  " :term colors need to be set manually
  if &background == "dark"
    let g:terminal_color_0="#181818"  "Black
    let g:terminal_color_1="#AB4642"  "Red
    let g:terminal_color_2="#A1B56C"  "Green
    let g:terminal_color_3="#F7CA88"  "Yellow
    let g:terminal_color_4="#7CAFC2"  "Blue
    let g:terminal_color_5="#BA8BAF"  "Magenta
    let g:terminal_color_6="#86C1B9"  "Cyan
    let g:terminal_color_7="#D8D8D8"  "White
    let g:terminal_color_8="#585858"  "Bright_Black
    let g:terminal_color_9="#AB4642"  "Bright_Red
    let g:terminal_color_10="#A1B56C" "Bright_Green
    let g:terminal_color_11="#F7CA88" "Bright_Yellow
    let g:terminal_color_12="#7CAFC2" "Bright_Blue
    let g:terminal_color_13="#BA8BAF" "Bright_Magenta
    let g:terminal_color_14="#86C1B9" "Bright_Cyan
    let g:terminal_color_15="#F8F8F8" "Bright_White
    let g:terminal_color_16="#DC9656"
    let g:terminal_color_17="#A16946"
    let g:terminal_color_18="#282828"
    let g:terminal_color_19="#383838"
    let g:terminal_color_20="#B8B8B8"
    let g:terminal_color_21="#E8E8E8"
  else
    let g:terminal_color_1="#df0000"
    let g:terminal_color_2="#008700"
    let g:terminal_color_3="#ffaf00"
    let g:terminal_color_4="#4271ae"
    let g:terminal_color_5="#8959a8"
    let g:terminal_color_6="#3e999f"
  endif
endif
" ----------------------------------------------------------------------------------------------------------------------------------
" plasticboy markdown
" ----------------------------------------------------------------------------------------------------------------------------------
let g:vim_markdown_fenced_languages=['java=java', 'scala=scala']
" ----------------------------------------------------------------------------------------------------------------------------------
" rainbow parenthesis
" ----------------------------------------------------------------------------------------------------------------------------------
let g:rainbow#max_level=16
let g:rainbow#pairs=[['(', ')'], ['[', ']'], ['{','}']]
" ----------------------------------------------------------------------------------------------------------------------------------
" tagbar
" ----------------------------------------------------------------------------------------------------------------------------------
let g:tagbar_compact=1
let g:tagbar_indent=1
" ==================================================================================================================================
" }}

