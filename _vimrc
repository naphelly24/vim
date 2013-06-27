set nocompatible " Use Vim settings, rather than VI settings. This must be first, because it changes other options as a side effect.
if has("win32")
  let $VIMFILES = $VIM.'/vimfiles'
else
  let $VIMFILES = $HOME.'/.vim'
endif
set rtp+=$VIM\vimfiles\vundle
"set rtp+=~/.vim/vundle
"call vundle#rc()
" let Vundle manage Vundle, required!
"Bundle 'gmarik/vundle'
" Powerline
"Bundle 'Lokaltog/vim-powerline'
" Better file browser
"Bundle 'scrooloose/nerdtree'
" Code commenter
"Bundle 'scrooloose/nerdcommenter'
" color scheme explorer
"Bundle 'sjas/csExplorer'
" code completion
"Bundle 'Shougo/neocomplcache'
" Python and PHP Debugger
"Bundle 'fisadev/vim-debug.vim'
" Search and read python documentation
"Bundle 'fs111/pydoc.vim'
" PEP8 and python-flakes checker

"Bundle 'nvie/vim-flake8'
" Code and files fuzzy finder
"Bundle 'kien/ctrlp.vim'
" Git integration
"Bundle 'motemen/git-vim'

" Bundles from vim-scripts repos
" Autocompletition
"Bundle 'AutoComplPop'
" Python code checker
"Bundle 'pyflakes.vim'
" Search results counter
"Bundle 'IndexedSearch'
" XML/HTML tags navigation
"Bundle 'matchit.zip'
" vimwiki
"Bundle 'vimwiki'
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" NOTE: comments after Bundle command are not allowed..
"
"
"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

"set dictionary=$VIM/words.dic
"press <C-x> <C-k> to complete your word in words.di


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on
"syntax enable
colorscheme molokai
"set background=dark
"handle gibberish code in text file (处理文本中显示乱码)
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
"windows has a different file encoding name with other OS
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
"handle gibberish code in menu & right click menu
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"handle gibberish code in console
language messages zh_CN.utf-8
" Use Unix as the standard file type
"set ffs=unix,dos,mac

"Font setting
if has('win32') || has('win64')
    set guifont =Consolas:h10:h12
    "set guifontwide=SimSun:h10:h12
    set guifontwide=Microsoft\ YaHei:h10:h12
    nmap ml :set guifont =Consolas:h16<CR>:set guifontwide=SimSun:h16<CR>
    nmap mn :set guifont =Consolas:h12<CR>:set guifontwide=SimSun:h12<CR>
    nmap ms :set guifont =Consolas:h10<CR>:set guifontwide=SimSun:h10<CR>
elseif has('mac')
    if getfontname( "Bitstream_Vera_Sans_Mono" ) != ""
        set guifont=Bitstream\ Vera\ Sans\ Mono:h13
    elseif getfontname( "DejaVu\ Sans\ Mono" ) != ""
        set guifont=DejaVu\ Sans\ Mono:h13
    endif
else
    set guifont =YaHei\ Consolas\ Hybrid\ 13
    "nmap mf :set guifont =YaHei\ Consolas\ Hybrid:h15<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700
set autoread
filetype indent on
filetype plugin on
"" Set 3 lines to the cursor - when moving vertically using j/k
set scrolloff=3
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set colorcolumn=80
hi colorcolumn guibg=lightgreen
"" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set confirm
"" share clipboard with windows
set clipboard+=unnamed
"set clipboard+=unnamedplus
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Turn backup off
set nobackup
"set nowb
"set noswapfile
""disable swap file
"setlocal noswapfile
"set bufhidden=hide

" persistent undo
set undofile
set undodir=$VIMFILES/\_undodir " you should create _undodir first!
set undolevels=1000 "maximum number of changes that can be undone


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text edit, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Linebreak on 500 characters
"set lbr
"set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set nu "line number

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"quick windows operation
nmap qq :quit<CR>
nmap sp :sp<CR>
nmap vs :vsp<CR>
"nmap ol :only<CR>
" replace a word with the word in default register
nmap \r hpl"pdw

"quick way to add something
"add line breaks in the next line
nmap \= yypVr=
"nmap == yypVr=o
nmap \- yypVr-
"nmap -- yypVr-0
"Make <CR> insert a new line in normal mode
nmap <CR> $a<CR><Esc>
""handle quickfix window
nmap <F6> :cp<cr>
nmap <F7> :cn<cr>

" VimTip 329: A map for swapping words
" http://vim.sourceforge.net/tip_view.php?tip_id=
" Then when you put the cursor on or in a word, press "\sw", and
" the word will be swapped with the next word.  The words may
" even be separated by punctuation (such as "abc = def").
nnoremap <unique> <silent><leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

nmap ,s :source $MYVIMRC<CR>
nmap ,e :e $MYVIMRC<CR>


"automatically change directory, important for nerdtree plugin
"This setting conflicts with many plugins
set bsdir=buffer
set autochdir


" ------------------------------------------------------------------
" Desc: Vim UI
" ------------------------------------------------------------------

set wildmenu " turn on wild menu, try typing :h and press <Tab>
set showcmd	" display incomplete commands
set ruler " show the cursor position all the time
"set hid " allow to change buffer without saving
set shortmess=atI " shortens messages to avoid 'press a key' prompt and no ad when launch vim
set lazyredraw " do not redraw while executing macros (much faster)
"set display+=lastline " for easy browse last line with wrap text
set cmdheight=2 "set cmdline height to 2, which looks cool
set laststatus=2            " show status bar (default is 1, can not display status bar)
"set status bar
set statusline=%F\ %m\ %r\ \ \ ASCII=%b,HEX=%B\ \ \ %=line:%-03l/%-03L\ col:%-03c\ %p%%\ \ \ %{strftime(\"%Y-%m-%d\ %H:%M\")}
" information of status bar：
" %F   file name
" %m   modify status
" %r   is readonly?
" %Y   filetype
" %{&fileformat}
"       file encoding
" %b    ASCII value of current char
" %B    HEX value of current char
" %l    line number of current line
" %c    column number of current char
" %V    virtual column number (calculated by bytes)
" %p    percentage of entire file
" %%    %
" %L    total line numbers

"Windows size initially
if has('gui_running') && has('win32')
    "maximize the window
    "au GUIENTER * simalt ~x
    "winpos 0 0
    set lines=30
    set columns=100
else
    winpos 0 0
    set lines=120
    set columns=200
endif

set showfulltag " show tag with function prototype
set go=
set go+=r
set go+=R
""隐藏工具栏set guioptions-=T
""隐藏菜单栏set guioptions-=m
""隐藏左边滚动条 set guioptions-=l set guioptions-=L
""隐藏右边滚动条 set guioptions-=r set guioptions-=R


" <F10> delete space at end
map <leader><space> :call HandleSpace()<CR>
func! HandleSpace()
	:%s/\s\+$//
" replace tab with spaces
"	:%retab!
endfunc

"set transparent
if has('mac') && has('gui_running')
   set transparency=0
   nmap ts : set transparency=11<CR>
   nmap Ts : set transparency=0<CR>
else
   nmap ts : call libcallnr("vimtweak.dll", "SetAlpha", 190)<CR>
   nmap Ts : call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
"   nmap <F11> <Esc>:call libcallnr("vimtweak.dll", "EnableMaximize", 1)<CR>
"   nmap <F12> <Esc>:call libcallnr("vimtweak.dll", "EnableMaximize", 0)<CR>
endif
""Use F11 to fullscreen just like in UNIX
"map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

"字符统计函数
"g<C-g> vim已自带

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Advanced Setting, .vim plugin needed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""----------------------------------------------------
""Requires /plugin/taglist.vim
""----------------------------------------------------
nnoremap <F8> :TlistToggle<CR>
if has('win32') || has('win64')
    "Only current file shown
    let Tlist_Show_One_File=1

    "Last window left, close it
    let Tlist_Exit_OnlyWindow=1
    let Tlist_File_Fold_Auto_Close=1

    ""Right side
    let Tlist_Use_Right_Window=1
    let Tlist_Show_Menu=1
elseif has('mac')
    "need: >sudo port install ctags for mac
    let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
endif
let Tlist_WinWidth = 60
"----------------------------------------------------
"Requires /plugin/conque_term.vim
"and python 2.7.1 (32-bit)
"----------------------------------------------------
let g:ConqueTerm_FastMode = 1
if has('win32') || has('win64')
    nmap sh :ConqueTerm powershell.exe<CR>
    nmap cm :ConqueTerm cmd<CR>
    nmap cy :ConqueTerm c:/cygwin/bin/bash.exe --login -i<CR>
elseif has('mac')
    nmap sh :ConqueTerm bash<CR>
endif

"----------------------------------------------------
"Requires /ftplugin/python_pydiction.vim
"Requires /ftplugin/pydiction
"----------------------------------------------------
let g:pydiction_location = '$VIM\vimfiles\ftplugin\pydiction\complete-dict'

""----------------------------------------------------
""Requires /plugin/nerdcommenter.vim
""----------------------------------------------------
let NERDCompactSexyComs=1
""----------------------------------------------------
""Requires /plugin/NERD_tree.vim
""		  /nerdtree_plugin/*.vim
""----------------------------------------------------
let NERDTreeBookmarksFile = $VIM.'/NERDTREE_BOOKMARK'
nmap <C-x><C-f> :NERDTreeToggle<CR>
nmap mf :NERDTreeFind<CR>
"nmap mm :NERDTreeMirror<CR>
if has('win32') || has('win64')
	nmap mc :NERDTree c://<CR>
	nmap md :NERDTree d://<CR>
	nmap me :NERDTree e://<CR>
	nmap mh :NERDTree ~//<CR>
else
	nmap mh :NERDTree ~/<CR>
endif

""----------------------------------------------------
""Requires plugin/minibufexpl.vim
""----------------------------------------------------
" use <C-h><C-j><C-k><C-l> to navigate frames.
let g:miniBufExplMapWindowNavVim = 1
" use <C-arrow> to navigate frames.
"let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"""----------------------------------------------------
"""		  neocomplcache.vim
"""----------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

""------------------------------------------------------------
""                     vimwiki
""------------------------------------------------------------
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{'path': 'D:/vimwiki/',
\ 'path_html': 'D:/vimwiki/html/',
\ 'html_header': 'D:/vimwiki/template/header.tpl',}]

""------------------------------------------------------------
""                     tasklist
""------------------------------------------------------------
let g:tlTokenList = ['todo', 'TODO', 'FIXME', 'fixme']
""------------------------------------------------------------
""other useful settings
""------------------------------------------------------------
""define and highlight in your way
"highlight MyGroup ctermbg=red guibg=red ctermfg=yellow guifg=yellow term=bold
"match MyGroup /test/
	""ctermbg : Background color in console
	""guibg : Background color in Gvim
	""ctermfg : Text color in console
	""guifg : Text color in Gvim
	""gui : Font formatting in Gvim
	""term : Font formatting in console (for example, bold)
"------------------------------------------------------------
""cursor tracking (this feature gives quite a slowdown when scrolling through the file)
"set cursorcolumn
"set cursorline
""------------------------------------------------------------
""use mouse anywhere in the window
"if has('mouse')
"	set mouse=a
"	set selection=exclusive
"	set selectmode=mouse,key
"endif
"

" fold {{{
"用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
set foldenable
"don't autofold anything (but I can still fold manually)
"set foldlevel=100
"set foldopen -=search don't open folds when search into them
"set foldopen -=undo
"fdm=expr: fde=getline(v\:lnum)=~'.'?1\:0: foldtext=foldtext().v\:folddashes.getline(v\:foldstart+1): foldcolumn=2
"去除空行
"set foldexpr=getline(v:lnum)=~'\\S'&&getline(v:lnum-1)!~'\\S'?'>1':'='
"au FileType fuck set fdm=expr | foldexpr=getline(v:lnum)=~'^\\S!'&&getline(v:lnum-1)!~'\\S'?'>1':'='
au FileType txt,vim,lisp set fdm=expr | set fde=getline(v\:lnum)=~'.'?1:0
			\ | set foldtext=foldtext().v:folddashes.getline(v:foldstart+1)
			\ | set foldcolumn=1
au FileType cpp,c,java set foldmethod=syntax | set foldcolumn=2
au FileType python,perl,tex,php,html,css,sh set foldmethod=indent
			\ | set foldcolumn=2
"nmap <leader>fc :set foldcolumn=1<cr>
"nmap <leader>fC :set foldcolumn=0<cr>
"}}}


"" This is useful when two lines is combined without a space
"map <leader>j gJdw

"" use jj to escape in insert mode
"inoremap jj <Esc>
