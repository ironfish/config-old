" ==================================================================================================================================
"
" <(✝)>< :: DOTFILES > vimrc
" Duncan K. DeVore / @ironfish
"
" ==================================================================================================================================
if &shell=~# 'fish$'
  set shell=/bin/sh
endif

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
Plug 'https://github.com/ervandew/supertab'                        " for tab completion
Plug 'https://github.com/rizzatti/dash.vim'                        " OSX only - requires dash installation
Plug 'https://github.com/Raimondi/delimitMate'                     " autocompletion for parens, brackets, etc.
Plug 'https://github.com/itspriddle/vim-marked'                    " markdown - requires tabular to load first
Plug 'https://github.com/derekwyatt/vim-scala'                     " scala support
Plug 'https://github.com/ironfish/scala-api-complete'              " my wip for scala completion
Plug 'https://github.com/benekastah/neomake'                       " async plugin for job-control
Plug 'https://github.com/Valloric/ListToggle'                      " toggles quickfix window
Plug 'https://github.com/chriskempson/base16-vim'                  " imho, best color schemes around
Plug 'https://github.com/itchyny/lightline.vim'                    " super awesome status line
Plug 'https://github.com/ap/vim-buftabline'                        " displays buffers in the tabline
Plug 'https://github.com/Yggdroot/indentLine'                      " indents as a thin vertical line.
Plug 'https://github.com/junegunn/rainbow_parentheses.vim'         " nested colored paranthesis
Plug 'https://github.com/scrooloose/nerdtree'                      " use because has plugin that support git integration
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'              " provides git integration for nerdtree
Plug 'https://github.com/dhruvasagar/vim-vinegar'                  " allows nerdtree to operate like netrw
Plug 'https://github.com/majutsushi/tagbar'                        " list functions and symbols
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
call plug#end()
" ==================================================================================================================================
" }}

" MAPPINGS {{
" ==================================================================================================================================
let mapleader="\<space>"                                               " for space, use let mapleader='\<space>'
set timeout                                                            " use timeoutlen between mapped key press
set timeoutlen=200                                                     " timeout length to wait in millis
vmap              <Enter> <Plug>(EasyAlign)|                           "KEYM start interactive easyalign visual mode
nmap              ga <Plug>(EasyAlign)|                                "KEYM start interactive easyalign
noremap           U <C-R>|                                             "KEYM ctrl-r sucks for redo, us U instead
nnoremap          <tab> %|                                             "KEYM jump between split pairs normal mode
vnoremap          <tab> %|                                             "KEYM jump between split pairs visual mode
nnoremap          ; :|                                                 "KEYM use ; for commands.
" move cursor down/up within non-breaking lines
nnoremap          j gj
nnoremap          k gk
noremap           <Up> gk
noremap           <Down> gj
inoremap          <Down> <C-o>gj
inoremap          <Up>   <C-o>gk
" NOTE VISUAL MODE:
"   1. ctrl-n will select the word(s) and place you in VISUAL mode
"   3. 'h','j','k' and 'l' will allow you to change the selection block
"   4. 'c' or 's' will delete the selected word(s) and enter INSERT mode
" NOTE NORMAL MODE:
"   1. use 'v' to enter normal mode
"   2. 'i' will insert at the cursor(s) current location
"   3. 'I' will move the cursor to the beginning of the line for insertion
"   4. 'a' will move the cursor to the end of the word for insertion
"   4. 'A' will move the cursor to the end of the line for insertion
let g:multi_cursor_next_key ='<C-n>'                                   "KEYM select word/next under cursor (v to enter normal mode)
let g:multi_cursor_prev_key ='<C-m>'                                   "KEYM select previous word
let g:multi_cursor_skip_key ='<C-x>'                                   "KEYM skip word
let g:multi_cursor_quit_key ='<Esc>'                                   "KEYM quit multi select
nnoremap <silent> <leader><leader> :Files<CR>|                         "KEYM fzf files search
nnoremap <silent> <leader><leader>b :Buffers<CR>|                      "KEYM fzf buffers search
nnoremap <silent> <leader><leader>l :BLines<CR>|                       "KEYM fzf lines in buffer
nnoremap <silent> <leader><leader>t :BTags<CR>|                        "KEYM fzf tags in buffer search
tnoremap          <leader>h <c-\><c-n>:call TermInsert("h")<cr>|       "KEYM navigate right to terminal window
tnoremap          <leader>l <c-\><c-n>:call TermInsert("l")<cr>|       "KEYM navigate right to terminal window
tnoremap          <leader>j <c-\><c-n>:call TermInsert("j")<cr>|       "KEYM navigate right to terminal window
tnoremap          <leader>k <c-\><c-n>:call TermInsert("k")<cr>|       "KEYM navigate right to terminal window
nnoremap          <leader>h :call TermInsert("h")<cr>|                 "KEYM navigate right to terminal window
nnoremap          <leader>l :call TermInsert("l")<cr>|                 "KEYM navigate right to terminal window
nnoremap          <leader>j :call TermInsert("j")<cr>|                 "KEYM navigate right to terminal window
nnoremap          <leader>k :call TermInsert("k")<cr>|                 "KEYM navigate right to terminal window
nnoremap          <leader>/ <C-w>v|                                    "KEYM neovim vertical window split
nnoremap          <leader>- <C-w>s|                                    "KEYM neovim horizontal window split
nnoremap <silent> <leader>// :vsp term://fish \| startinsert<CR>|      "KEYM neovim vertical terminal split
nnoremap <silent> <leader>-- :sp term://fish \| startinsert<CR>|       "KEYM neovim horizontal terminal split
nmap     <silent> <leader>a <Plug>DashSearch|                          "KEYM search dash for cursor word
nnoremap          <leader>b :CtrlPBuffer<cr>|                          "KEYM ctrlp buffer
nmap              <leader>c <Plug>(caw:I:toggle)|                      "KEYM comment normal mode
vmap              <leader>c <Plug>(caw:I:toggle)|                      "KEYM comment visual mode
nnoremap          <leader>d :bd<CR>|                                   "KEYM delete current buffer
imap              <leader>b <esc>0|                                    "KEYM go to beginning of line insert mode
nnoremap          <leader>b 0|                                         "KEYM go to beginning of line normal mode
vnoremap          <leader>b 0|                                         "KEYM go to beginning of line visual mode
imap              <leader>e <esc>$|                                    "KEYM go to end of line insert mode
nnoremap          <leader>e $|                                         "KEYM go to end of line normal mode
vnoremap          <leader>e $|                                         "KEYM go to end of line visual mode
nnoremap          <leader>f za|                                        "KEYM toggle fold
nnoremap          <leader>gd :Gdiff<CR>|                               "KEYM git diff
nnoremap          <leader>gg :GitGutterToggle<CR>|                     "KEYM toggle gitgutter
nmap              <leader>gs :Gstatus<CR>gg<c-n>|                      "KEYM git status
nnoremap          <leader>hh :noh<cr>|                                 "KEYM toggle highlight
nnoremap          <leader>i :set list!<CR>|                            "KEYM toggle invisibles
nnoremap <silent> <Leader>m :call ShowMaps()<CR>|                      "KEYM show key mappings
nnoremap          <leader>n :call ToggleNumber()<CR>|                  "KEYM toggle number/relative number
nnoremap          <leader>r :RainbowParentheses!!<CR>|                 "KEYM toggle rainbow
map               <leader>s :setlocal spell!<cr>|                      "KEYM set spell check
nnoremap          <leader>t :NERDTreeToggle<CR>|                       "KEYM toggle nerdtree
nnoremap          <leader>w :w!<cr>|                                   "KEYM save
let g:lt_location_list_toggle_map = '<leader>z'                        "KEYM toggle quickfix window
nnoremap          <leader>ww :source $MYVIMRC<CR>|                     "KEYM reload nvimrc

" force neovim terminal to enter insert mode
function! TermInsert(direction)
  stopinsert
  execute "wincmd" a:direction
  if &buftype == 'terminal'
    startinsert!
  endif
endfunction

function! ShowMaps()
  :! ag --nocolor --nonumbers 'KEYM' $MYVIMRC | sed -E 's/^(( )*)?(.*)/\3/'
endfunction
" ==================================================================================================================================
" }}

" DEFAULTS {{
" ==================================================================================================================================
" ----------------------------------------------------------------------------------------------------------------------------------
" appearance
" ----------------------------------------------------------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1             " enable true color
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1           " change curser shape in insert mode
syntax enable                                 " enable syntax
colorscheme base16-default                    " colorscheme
colorscheme base16-tomorrow                    " colorscheme
set background=dark                           " important for dark schemes
set colorcolumn=+1                            " increase the left margin by 1
set cursorcolumn                              " highlight the current column
set laststatus=2                              " show the status line
set lazyredraw                                " redraw only when needed
set listchars+=tab:›\ "
set listchars+=trail:·
set listchars+=nbsp:␣
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=eol:¶"
set matchpairs=(:),[:],{:},<:>                " highlight matching tags
set nocursorline                              " NOTE: causes prolems with .md; do not highlight the current line
set noshowmode                                " hide show mode in status line, using lightline plugin, not needed
set nostartofline                             " keep the cursor on the same column
set number                                    " show line numbers
set ruler                                     " show the line and column number of the cursor
set scrolloff=8                               " keep cursor 8 lines from top and bottom when page scrolls
set showcmd                                   " show partial command in the last line of the screen
"set title                                    " NOTE: cause problems in neovim; set current file name to the title
set tags=tags;/
" ----------------------------------------------------------------------------------------------------------------------------------
" behavior
" ----------------------------------------------------------------------------------------------------------------------------------
filetype on                                   " detect filetype
filetype indent on                            " detect filetype specific indenting
filetype plugin on                            " detect filetype specific plugins
set autoread                                  " notify when file has changed outside of vim/nvim
set autowriteall                              " write on exit
set backspace=indent,eol,start                " backspace over auto-indent, eol, start to join lines
set clipboard=unnamed                         " use system clipboard
set encoding=utf-8                            " set default encoding (default in nvim)
set hidden                                    " hide buffers when abandoned, will allow movement to another without saving
set history=100                               " remember some stuff
set mouse=a                                   " enable mouse
set noerrorbells                              " turn off error bells
set novisualbell                              " turn off visual bell
set splitbelow                                " default horizontal split is below
set splitright                                " default vertical split is to the right
if has('virtualedit')                         " ctrl-v to select text in block mode
  set virtualedit+=block                      " let me move cursor anywhere in buffer
endif
set whichwrap=h,l,[<]>],[<\>]                 " make cursor keys wrap (] and \ are for right and left arrows
" ----------------------------------------------------------------------------------------------------------------------------------
" folding
" ----------------------------------------------------------------------------------------------------------------------------------
set foldlevel=0                               " open all the highest level folds
set foldlevelstart=10                         " open most folds by default
set foldmarker={{,}}                          " default fold marker
set foldmethod=marker                         " default fold method
set foldnestmax=10                            " maximum number of nested folds
set nofoldenable                              " do not fold on start
" ----------------------------------------------------------------------------------------------------------------------------------
" formatting
" ----------------------------------------------------------------------------------------------------------------------------------
set formatoptions+=r                          " continue comments by default
set formatoptions+=o                          " make comment when using o or O from comment line
set formatoptions+=q                          " format comments with gq
set formatoptions+=n                          " recognize numbered lists
set formatoptions+=c                          " format comments
set formatoptions+=t                          " wrap when using textwidth
set linebreak                                 " wrap long lines at a character
set nojoinspaces                              " don't join lines with two spaces at the end of sentences
set nolist                                    " do not show whitespace characters on start
set showbreak=↪                               " line break character for wrapped lines
set synmaxcol=132                             " scrolling can be very slow for long wraps (i.e. columns)
set textwidth=0                               " no hard breaks unless i press enter
set wrap                                      " wrap text at window width
" ----------------------------------------------------------------------------------------------------------------------------------
" indents
" ----------------------------------------------------------------------------------------------------------------------------------
set autoindent                                " copy indent from current line
set shiftwidth=2                              " number of spaces to use for indent
set smartindent                               " smart auto-indenting when starting a new line
" ----------------------------------------------------------------------------------------------------------------------------------
" menus
" ----------------------------------------------------------------------------------------------------------------------------------
set showfulltag                               " show the whole tag, not just the function name
set wildmenu                                  " set menu for tab key
set wildmode=list:longest,full                " complete only up to the point of ambiguity
" ----------------------------------------------------------------------------------------------------------------------------------
" search                                      " NOTE: type / followed by ctrl-f to open search history window
" ----------------------------------------------------------------------------------------------------------------------------------
let @/ = ""                                   " clear the last search results on loading of file
set hlsearch                                  " highlight search results
set incsearch                                 " incremental highlight as search is typed
set ignorecase                                " set search to ignore case
set smartcase                                 " case sensitive search when given caps
set wrapscan                                  " set search to wrap lines
" ----------------------------------------------------------------------------------------------------------------------------------
" spelling
" ----------------------------------------------------------------------------------------------------------------------------------
set complete+=kspell                          " turn on tab completion for spelling
set dictionary+=/usr/share/dict/words         " unix/osx dictionary
set spellfile=$HOME/.nvim/spell/en.utf8.add   " spelling whitelist
set spelllang=en_us                           " spelling language
" ----------------------------------------------------------------------------------------------------------------------------------
" tabs vs spaces
" ----------------------------------------------------------------------------------------------------------------------------------
set expandtab                                 " replace tabs with spaces
set smarttab                                  " when on, a <Tab> in front of a line inserts blanks
set softtabstop=2                             " use 2 spaces, interpret tab as indent
set tabstop=2                                 " set tab width
" ----------------------------------------------------------------------------------------------------------------------------------
" directories
" ----------------------------------------------------------------------------------------------------------------------------------
set backup                                    " backup file
set backupdir=~/dotfiles/tmp/nvim-backup//    " backup directory
set writebackup                               " backup before overwriting original file
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

set directory=~/dotfiles/tmp/nvim-swap//      " swap directory
set shortmess+=A                              " don't warn when there is an existing swap file
set updatetime=500                            " time in millis until next swap file is written
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

set undodir=~/dotfiles/tmp/nvim-undo//        " undo directory
set undofile                                  " returns name of undo file
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif

set viewdir=~/dotfiles/tmp/nvim-view//        " view directory
if !isdirectory(expand(&viewdir))
  call mkdir(expand(&viewdir), "p")
endif

if !has('nvim')
  set viminfo='1000,n~/dotfiles/tmp/viminfo
else
  set viminfo='1000,n~/dotfiles/tmp/nviminfo
endif

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

" FILE-TYPES {{
" ==================================================================================================================================
" ----------------------------------------------------------------------------------------------------------------------------------
" java
" ----------------------------------------------------------------------------------------------------------------------------------
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
" markdown
" ----------------------------------------------------------------------------------------------------------------------------------
augroup filetype_markdown
  autocmd!
  " required so vim does not think .md files are something else
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  let g:markdown_fenced_languages = ['bash=sh', 'css', 'django', 'java',
      \ 'javascript', 'js=javascript', 'json=javascript', 'perl', 'php', 'python', 'ruby',
      \ 'scala', 'sass', 'xml', 'html']
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
  autocmd FileType scala setlocal omnifunc=scalaapi#complete
augroup END
" ==================================================================================================================================
" }}

" PLUGINS {{
" ==================================================================================================================================
" ----------------------------------------------------------------------------------------------------------------------------------
" buftabline
" ----------------------------------------------------------------------------------------------------------------------------------
let g:buftabline_indicators=1  " buffer's state is indicated in the buffer label
let g:buftabline_show=1        " only if there are at least two buffers
let g:buftabline_numbers=1     " the buffer number is shown in the buffer label
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
let g:gitgutter_sign_column_always=0         " disable gutter when gitgutter disabled
let g:gitgutter_enabled=1                    " enable at start
let g:gitgutter_max_signs=1000               " max signs
let g:gitgutter_sign_added="\u271a"          " heavy greek cross
let g:gitgutter_sign_modified="\u279c"       " heavy rounded-tip rightwards arrow
let g:gitgutter_sign_removed="\u2718"        " heavy ballot X
let g:gitgutter_sign_modified_removed="►"    " medium right facing triangle
let g:gitgutter_signs=1                      " enable signs by default
let g:gitgutter_highlight_lines=0            " enable line highlights
" gitgutter will use Sign Column to set its color, reload it
call gitgutter#highlight#define_highlights()
" ----------------------------------------------------------------------------------------------------------------------------------
" indentline
" ----------------------------------------------------------------------------------------------------------------------------------
let g:indentLine_char='┋'
let g:indentLine_leadingSpaceChar="."
let g:indentLine_leadingSpaceEnabled=1
" ----------------------------------------------------------------------------------------------------------------------------------
" lightline
" ----------------------------------------------------------------------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'gitgutter', 'fugitive', 'filename' ] ],
  \   'right': [ [ 'trailing', 'indentation', 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype'] ]
  \ },
  \ 'component_function': {
  \   'gitgutter': 'MyGitGutter',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'lineinfo': 'MyLineinfo',
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
  return fname == '__Tagbar__' ? '' :
    \ fname =~ 'NERD_tree' ? '' :
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
let g:neomake_open_list = 0 " Disable cursor stealing.
let g:neomake_scala_enabled_makers = ['scalastyle']
let g:neomake_python_enabled_makers = ['pep8', 'flake8']
let g:neomake_python_pep8_maker = {
  \ 'args': ['--max-line-length 99'],
  \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
  \ }
autocmd! BufWritePost,BufReadPost * Neomake
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
  endif
endif
" ----------------------------------------------------------------------------------------------------------------------------------
" nerdtree
" ----------------------------------------------------------------------------------------------------------------------------------
let NERDTreeBookmarksFile=expand("$HOME/dotfiles/tmp/ntbookmarks")    " set bookmarks file
let NERDTreeHijackNetrw=1    " make nerdtree act like netrw
let NERDTreeShowBookmarks=1  " show bookmarks table
let NERDTreeShowHidden=1     " show hidden files
" ----------------------------------------------------------------------------------------------------------------------------------
" rainbow parenthesis
" ----------------------------------------------------------------------------------------------------------------------------------
let g:rainbow#max_level=16
let g:rainbow#pairs=[['(', ')'], ['[', ']'], ['{','}']]
" ----------------------------------------------------------------------------------------------------------------------------------
" supertab
" ----------------------------------------------------------------------------------------------------------------------------------
"@see - https://github.com/ervandew/supertab/issues/99
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType="<c-p>"
let g:SuperTabCompletionContexts=['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery=["&omnifunc:<c-x><c-o>"]
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif
" ----------------------------------------------------------------------------------------------------------------------------------
" tagbar
" ----------------------------------------------------------------------------------------------------------------------------------
let g:tagbar_compact=1
let g:tagbar_indent=1
" ==================================================================================================================================
" }}

