" ==================================================================================================================================
"
" <(✝)>< :: DOTFILES > vimrc
" Duncan K. DeVore / @ironfish
"
" ==================================================================================================================================
set shell=/bin/sh

" PLUG#BEGIN (plugin manager begin) {{
call plug#begin('~/.config/nvim/plugged')

" airblade/vim-gitgutter {{
Plug 'airblade/vim-gitgutter'
function! InitGitGutter()
  let g:gitgutter_sign_column_always=0
  let g:gitgutter_enabled=1
  let g:gitgutter_max_signs=1000
  let g:gitgutter_sign_added="\u271a"           " heavy greek cross
  let g:gitgutter_sign_modified="\u279c"        " heavy rounded-tip rightwards arrow
  let g:gitgutter_sign_removed="\u2718"         " heavy ballot X
  let g:gitgutter_sign_modified_removed="►"     " medium right facing triangle
  let g:gitgutter_signs=1
  let g:gitgutter_highlight_lines=0
  call gitgutter#highlight#define_highlights()  " gitgutter will use Sign Column to set its color, reload it
endfunction
"}}

" tpope/vim-fugitive {{
Plug 'tpope/vim-fugitive'
function! InitFugative()
  nnoremap <leader>gd :Gdiff<CR>
  nmap     <leader>gs :Gstatus<CR>gg<c-n>
endfunction
" }}

" junegunn/vim-easy-align {{
Plug 'junegunn/vim-easy-align'
function! InitEasyAlign()
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga      <Plug>(EasyAlign)
endfunction
" }}

" godlygeek/tabular {{
Plug 'godlygeek/tabular'
"}}

" terryma/vim-multiple-cursors {{
Plug 'terryma/vim-multiple-cursors'
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
function! InitMultipleCursors()
  let g:multi_cursor_next_key='<C-n>'            " select word/next under cursor
  let g:multi_cursor_prev_key='<C-m>'            " select previous word
  let g:multi_cursor_skip_key='<C-x>'            " skip word
  let g:multi_cursor_quit_key='<Esc>'            " quit multi select

  let g:multi_cursor_use_default_mapping=0
  function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
  endfunction

  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
  endfunction

endfunction

" tpope/vim-commentary {{
Plug 'tpope/vim-commentary'                      " comment stuff
function! InitCommentary()
  nmap <leader>/ :Commentary <CR>
  vmap <leader>/ :Commentary <CR>
endfunction
" }}

Plug 'tpope/vim-eunuch'                          " unix commands
Plug 'tpope/vim-surround'                        " surround with brackets, quotes, etc.
Plug 'Raimondi/delimitMate'                      " autocompletion for parens, brackets, etc.
" }}

" junegunn/fzf {{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
"}}

" junegunn/fzf.vim {{
Plug 'junegunn/fzf.vim'
function! InitFzfVim()
  " display finder info inline with query
  if has('nvim')
  "  let $FZF_DEFAULT_COMMAND='ag -l -g ""'
  "  let $FZF_DEFAULT_OPTS=' --inline-info'
  endif

  " these colors are for dark
  function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
  endfunction

  autocmd! User FzfStatusLine call <SID>fzf_statusline()

  nnoremap <silent> <leader>f :Files<CR>
  nnoremap <silent> <leader>b :Buffers<CR>
  nnoremap <silent> <leader>t :BTags<CR>
endfunction
" }}

" junegunn/vim-pseudocl {{
Plug 'junegunn/vim-pseudocl'
" }}

" junegunn/vim-oblique (requires vim-pseudocl to load first) {{
Plug 'junegunn/vim-oblique'
" }}

" justinmk/vim-dirvish (file explorer) {{
Plug 'justinmk/vim-dirvish'
function! InitDirvish()
  let g:loaded_netrwPlugin = 1
  let g:dirvish_hijack_netrw = 1
  command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
  command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
  nnoremap gx :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<cr>
  nnoremap <silent> - :Dirvish %:p:h<cr>

  "augroup my_dirvish_event
  "  autocmd!
  "  autocmd FileType dirvish call fugitive#detect(@%)
  "augroup END
endfunction
" }}

" rizzatti/dash.vim {{
Plug 'rizzatti/dash.vim',  { 'on': 'Dash' }
function! InitDash()
  nmap <silent> <leader>a <Plug>DashSearch
endfunction
" }}

" rking/ag.vim {{
Plug 'rking/ag.vim'
" }}

" itspriddle/vim-marked (opens marked2 app) {{
Plug 'itspriddle/vim-marked'
" }}

" plasticboy/vim-markdown (requires tablular to load first) {{
Plug 'plasticboy/vim-markdown'
function! InitVimMarkdown()
  let g:vim_markdown_fenced_languages=['java=java', 'scala=scala']
endfunction
" }}

" artur-shaik/vim-javacomplete2 {{
Plug 'artur-shaik/vim-javacomplete2'
function! InitVimJavaComplete()
  let g:JavaComplete_UsePython3 = 1
  let g:JavaComplete_MavenRepositoryDisable = 1
endfunction
" }}

" benekastah/neomake {{
Plug 'benekastah/neomake'
function! InitNeomake()
  let g:neomake_open_list = 1
  let g:neomake_scala_enabled_makers = ['scalastyle']
  let g:neomake_python_enabled_makers = ['pep8', 'flake8']
  let g:neomake_python_pep8_maker = {
    \ 'args': ['--max-line-length 99'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
  let g:neomake_sbt_maker = {
    \ 'exe': 'sbt',
    \ 'args': ['-Dsbt.log.noformat=true', '~compile'],
    \ 'errorformat':
    \ '%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,%-G%.%#',
    \ 'buffer_output': 1
    \ }

  "autocmd! BufWritePost,BufReadPost * Neomake
endfunction
" }}

" derekwyatt/vim-scala {{
Plug 'derekwyatt/vim-scala'
" }}

" ironfish/scala-api-complete {{
Plug 'ironfish/scala-api-complete'
" }}

" ludovicchabant/vim-gutentags {{
Plug 'ludovicchabant/vim-gutentags'
" }}

" Shougo/deoplete.nvim {{
Plug 'Shougo/deoplete.nvim'
function InitDeoplete()
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_camel_case = 1
  let g:deoplete#auto_complete_delay = 100
  set pumheight=15                                           " limit completion menu height

  " <TAB>: completion.
  imap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#mappings#manual_complete()

  function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction "}}}

  function! s:my_cr_function() abort
    return deoplete#mappings#close_popup() . "\<CR>"
  endfunction

  " <S-TAB>: completion back.
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k> ("\<C-p>")
endfunction
" }}

" vim-jp/vim-java (better java syntax) {{
Plug 'vim-jp/vim-java'
" }}

" colorschemes {{
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
" }}

" ap/vim-buftabline {{
Plug 'ap/vim-buftabline'
function! InitBuftabline()
  let g:buftabline_indicators=1  " buffer's state is indicated in the buffer label
  let g:buftabline_show=2        " always show buffer tabline
  let g:buftabline_numbers=1     " the buffer number is shown in the buffer label
  let g:buftabline_separators=1  " draw thin vertical line between buffer tabs
endfunction
" }}

" gcavallanti/vim-noscrollbar (eye candy) {{
Plug 'gcavallanti/vim-noscrollbar'
" }}

" itchyny/lightline.vim {{
Plug 'itchyny/lightline.vim'
function! InitLightline()
  let g:lightline = {
    \ 'colorscheme': 'PaperColor',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'gitgutter', 'fugitive', 'filename' ] ],
    \   'right': [ [ 'trailing', 'indentation', 'lineinfo' ], [ 'tags', 'percent' ], [ 'noscrollbar', 'fileformat', 'fileencoding', 'filetype'] ]
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
    \   'noscrollbar': 'MyNoScrollbar',
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

  function! MyNoScrollbar()
    return noscrollbar#statusline(20,'■','◫',['◧'],['◨'])
  endfunction

  function! MyModified()
    return  s:ftMatches('help') ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! MyReadonly()
    return s:ftMatches('help') && &readonly ? "\uf0c1" : ''
  endfunction

  function! MyFugitive()
    if expand('%:t') !~? 'Tagbar' && &ft !~? 'dirvish' && exists('*fugitive#head')
      let mark = "\uf126"  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark . ' ' . _ : ''
    endif
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
    if expand('%:t') !~? 'Tagbar' && &ft !~? 'dirvish' && exists('*gutentags#statusline')
      let mark = "\uf02b"  " edit here for cool mark
      let _ = gutentags#statusline('....')
      return strlen(_) ? mark . ' ' . _ : mark
    endif
  endfunction

  " credit to https://github.com/obxhdx/vimfiles/blob/master/lightline.vim
  function! TrailingSpaceWarning()
    if s:ftMatches('help') || winwidth(0) < 80 | return '' | endif
    let l:trailing = search('\s$', 'nw')
    return (l:trailing != 0) ? '… trailing[' . trailing . ']' : ''
  endfunction

  function! MixedIndentSpaceWarning()
    if s:ftMatches('help') || winwidth(0) < 80 | return '' | endif
    let l:tabs = search('^\t', 'nw')
    let l:spaces = search('^ ', 'nw')
    return (l:tabs != 0 && l:spaces != 0) ? '» mixed-indent[' . tabs . ']' : ''
  endfunction

  au VimEnter * let g:total_width = winwidth(0)

  function! s:ftMatches(ft_name)
    return &ft =~ a:ft_name
  endfunction

  autocmd! CursorHold,BufWritePost,BufReadPost,InsertLeave * call s:update()

  function! s:update()
    call TrailingSpaceWarning()
    call MixedIndentSpaceWarning()
    call MyGutenTags()
    call MyNoScrollbar()
    call lightline#update()
  endfunction

endfunction
" }}

" junegunn/rainbow_parentheses.vim {{
Plug 'junegunn/rainbow_parentheses.vim'
function! InitRainbowParentheses()
  let g:rainbow#max_level=16
  let g:rainbow#pairs=[['(', ')'], ['[', ']'], ['{','}']]
  call rainbow_parentheses#activate()
endfunction
" }}

" majutsushi/tagbar {{
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
function! InitTagbar()
  let g:tagbar_compact=1
  let g:tagbar_indent=1
  nnoremap <leader>tt :TagbarToggle<CR>
endfunction
" }}

" Yggdroot/indentLine {{
Plug 'Yggdroot/indentLine'
function! InitIndentline()
  let g:indentLine_concealcursor=""
  let g:indentLine_leadingSpaceChar="\u00b7"
  let g:indentLine_leadingSpaceEnabled=1
  let g:indentLine_color_term = 237
endfunction
" }}

call plug#end()
" }}

" editor mappings {{
let mapleader="\<space>"
set timeout
set timeoutlen=200

" toggle highlight
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" allow movement within wapped lines
nnoremap j gj
nnoremap k gk
noremap <Up> gk
noremap <Down> gj
inoremap <Down> <C-o>gj
inoremap <Up>   <C-o>gk

" exit insert mode
inoremap jj <ESC>

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" goto start/end of line
inoremap <A-0> <C-o>0
inoremap <A-$> <C-o>$

" move to the start of the next/prev word
noremap <A-b> <C-o>b
inoremap <A-w> <C-o>w

" neovim vertical window split
nnoremap <leader>/ <C-w>v

" neovim horizontal window split
nnoremap <leader>- <C-w>s

" toggle invisibles
nnoremap <leader>i :set list!<CR>

" buffer management
nnoremap <leader>d :bd<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>

" toggle number/relative number
nnoremap <leader>r :call ToggleNumber()<CR>

" set spell check
map <leader>s :setlocal spell!<cr>

" reload init.vim
nnoremap <leader>v :source $MYVIMRC<CR>

" save
nnoremap <leader>w :w!<cr>

" use ; for commands.
nnoremap ; :

" jump between split pairs normal mode
nnoremap <tab> %
vnoremap <tab> %

" set working directory to current buffer
nnoremap cd :lcd %:p:h<bar>pwd<cr>
nnoremap cD :cd %:p:h<bar>pwd<cr>

" set working directory up one level from current buffer
nnoremap cu :lcd ..<bar>pwd<cr>
nnoremap cU :cd ..<bar>pwd<cr>

" ctrl-r sucks for redo, us U instead
noremap U <C-R>

" tags jump to definition
nnoremap <C-]> g<C-]>

" python hosts for neovim
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" toggle relative line numbers
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction
" }}

" appearance {{
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1           " enable true color
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1          " change curser shape in insert mode
syntax enable
colorscheme papercolor
set background=dark
set colorcolumn=+1                           " increase the left margin by 1
"set cursorline                               " highlight current line
set cursorcolumn                             " show vertical line
set laststatus=2                             " show the status line
set lazyredraw                               " don't update the display while executing macros
set listchars+=tab:›\ "
set listchars+=trail:·
set listchars+=nbsp:␣
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=eol:¶"
set matchpairs=(:),[:],{:},<:>               " highlight matching tags
set noshowmode                               " hide show mode in status line, using lightline plugin, not needed
set nostartofline                            " keep the cursor on the same column
set number                                   " show line numbers
set ruler                                    " show the line and column number of the cursor
set scrolloff=8                              " keep cursor 8 lines from top and bottom when page scrolls
"set showcmd                                  " show partial command in the last line of the screen
" }}

" behavior {{
set autoread                                 " notify when file has changed outside of vim/nvim
set autowriteall                             " write on exit
set backspace=indent,eol,start               " backspace over auto-indent, eol, start to join lines
set clipboard=unnamed                        " use system clipboard
set hidden                                   " hide buffers when abandoned, will allow movement to another without saving
set history=100                              " keep some stuff in history
set mouse=a                                  " enable mouse for all modes
set noerrorbells                             " do not ring bell for errors
set visualbell t_vb=                         " no visual bells either
set splitbelow                               " default horizontal split is below
set splitright                               " default vertical split is to the right
set virtualedit+=block                       " ctrl-v to select text in block mode, let me move cursor anywhere in buffer
set whichwrap=h,l,[<]>],[<\>]                " make cursor keys wrap (] and \ are for right and left arrows
set tags=./tags;/                            " tags location
" }}

" folding {{
set foldlevel=0                              " open all the highest level folds
set foldlevelstart=10                        " open most folds by default
set foldmarker={{,}}                         " default fold marker
set foldmethod=marker                        " default fold method
set foldnestmax=10                           " maximum number of nested folds
set nofoldenable                             " do not fold on start
" }}

" formatting {{
set formatoptions+=r                         " continue comments by default
set formatoptions+=o                         " make comment when using o or O from comment line
set formatoptions+=q                         " format comments with gq
set formatoptions+=n                         " recognize numbered lists
set formatoptions+=c                         " format comments
set formatoptions+=t                         " wrap when using textwidth
set linebreak                                " wrap long lines at a character
set nojoinspaces                             " don't join lines with two spaces at the end of sentences
set nolist                                   " do not show whitespace characters on start
set showbreak=↪                              " line break character for wrapped lines
set synmaxcol=132                            " scrolling can be very slow for long wraps (i.e. columns)
set textwidth=0                              " no hard breaks unless i press enter
set wrap                                     " wrap text at window width
" }}

" indents {{
set autoindent                               " copy indent from current line
set shiftwidth=2                             " number of spaces to use for indent
set smartindent                              " smart auto-indenting when starting a new line
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
" }}

" menus {{
set showfulltag                              " show the whole tag, not just the function name
set wildignore+=tags                         " things to ignore
set wildmenu                                 " set menu for tab key
set wildmode=list:longest,full               " complete only up to the point of ambiguity
" }}

" search {{
" NOTE: type / followed by ctrl-f to open search history window
" clear the last search results on loading of file
let @/ = ""
set hlsearch                                 " highlight search results
set incsearch                                " incremental highlight as search is typed
set ignorecase                               " set search to ignore case
set smartcase                                " case sensitive search when given caps
set wrapscan                                 " set search to wrap lines
" }}

" spelling {{
set complete+=kspell                         " trun on tab completion for spelling
set dictionary+=/usr/share/dict/words        " unix/osx dictionary
set spellfile=$HOME/.nvim/spell/en.utf8.add  " spelling whitelist
set spelllang=en_us                          " spelling language
" }}

" tabs vs spaces {{
set expandtab                                " replace tabs with spaces
set smarttab                                 " when on, a <Tab> in fron of a line inserts blanks
set softtabstop=2                            " use 2 spaces, interpret tab as indent
set tabstop=2                                " set tab width
" }}

" directories {{
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
" }}

call InitDash()
call InitRainbowParentheses()
call InitTagbar()
call InitDirvish()
call InitEasyAlign()
call InitMultipleCursors()
call InitCommentary()
call InitFzfVim()
call InitFugative()
call InitGitGutter()
call InitBuftabline()
call InitDeoplete()
call InitIndentline()
call InitLightline()
call InitNeomake()
call InitVimMarkdown()
call InitVimJavaComplete()

" augroup/java {{
let g:java_highlight_functions="style"
let g:java_allow_cpp_keywords = 1
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
" }}

" augroup/html {{
augroup filetype_html
  autocmd!
  autocmd FileType html setlocal shiftwidth=4
  autocmd FileType html setlocal tabstop=4
  autocmd FileType html setlocal softtabstop=4
  autocmd FileType html setlocal expandtab
augroup END
" }}

" augroup/python {{
augroup filetype_python
  autocmd!
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal expandtab
augroup END
" }}

" augroup/scala {{
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
" }}

" neovim/terminal {{
" neovim vertical terminal split
nnoremap <silent> <leader>// :vsp term://fish \| startinsert<CR>

" neovim horizontal terminal split
nnoremap <silent> <leader>-- :sp term://fish \| startinsert<CR>

" navigate left to terminal/window
tnoremap <silent> <leader>h <c-\><c-n>:call TermInsert("h")<cr>
nnoremap <silent> <leader>h :call TermInsert("h")<cr>

" navigate right to terminal/window
tnoremap <silent> <leader>l <c-\><c-n>:call TermInsert("l")<cr>
nnoremap <silent> <leader>l :call TermInsert("l")<cr>

" navigate down to terminal/window
tnoremap <silent> <leader>j <c-\><c-n>:call TermInsert("j")<cr>
nnoremap <silent> <leader>j :call TermInsert("j")<cr>

" navigate up to terminal/window
tnoremap <silent> <leader>k <c-\><c-n>:call TermInsert("k")<cr>
nnoremap <silent> <leader>k :call TermInsert("k")<cr>

" force neovim terminal to enter insert mode
function! TermInsert(direction)
  stopinsert
  execute "wincmd" a:direction
  if &buftype == 'terminal'
    startinsert!
  endif
endfunction

if exists(':terminal')
  " allow terminal buffer size to be very large
  let g:terminal_scrollback_buffer_size = 100000

  "black normal/bright
  let g:terminal_color_0="#2c2c2c"
  let g:terminal_color_8="#545454"

  "red normal/bright
  let g:terminal_color_1="#c62828"
  let g:terminal_color_9="#ef5350"

  "green normal/bright
  let g:terminal_color_2="#558b2f"
  let g:terminal_color_10="#8bc34a"

  "yellow normal/bright
  let g:terminal_color_3="#f9a825"
  let g:terminal_color_11="#ffeb3b"

  "blue normal/bright
  let g:terminal_color_4="#1565c0"
  let g:terminal_color_12="#64b5f6"

  "magenta normal/bright
  let g:terminal_color_5="#6a1e9a"
  let g:terminal_color_13="#ba68c8"

  "cyan normal/bright
  let g:terminal_color_6="#00838f"
  let g:terminal_color_14="#26c6da"

  "white normal/bright
  let g:terminal_color_7="#f2f2f2"
  let g:terminal_color_15="#e0e0e0"
endif
" }}


