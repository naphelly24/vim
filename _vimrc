set nocompatible " Use Vim settings, rather than VI settings. This must be first, because it changes other options as a side effect.
if has("win32")
  let $VIMFILES = $VIM.'/vimfiles'
else
  let $VIMFILES = $HOME.'/.vim'
endif

" NOTE: comments after Bundle command are not allowed..
set rtp+=$VIMFILES\vundle
"set rtp+=~/.vim/vundle
call vundle#rc($VIMFILES.'/vundle_plugins')
" let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'
" Powerline
Bundle 'Lokaltog/vim-powerline'
" Better file browser
"Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'

" vim-snipmate needs vim-addon-mw-utils and tlib-vim
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'

Bundle 'TaskList.vim'
" PEP8 and python-flakes checker
Bundle 'pyflakes.vim'
Bundle 'nvie/vim-flake8'
Bundle 'fs111/pydoc.vim'

Bundle 'minibufexpl.vim'

"TODO: get it done some day!!!
"Bundle 'Valloric/YouCompleteMe'

" Search results counter
Bundle 'IndexedSearch'

"Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-git'
"Bundle 'ervandew/supertab'
"Bundle 'wincent/Command-T'
"Bundle 'sjl/gundo.vim'
"Bundle 'alfredodeza/pytest.vim'
"Bundle 'reinh/vim-makegreen'
"Bundle 'scrooloose/nerdtree'

Bundle 'vimwiki'
" color scheme explorer
"Bundle 'sjas/csExplorer'
" Python and PHP Debugger
"Bundle 'fisadev/vim-debug.vim'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'

" XML/HTML tags navigation
"Bundle 'matchit.zip'
"
"
"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on
filetype indent on
filetype plugin indent on
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
    "set guifontwide=Microsoft\ YaHei:h10:h12
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
"" use Ctrl+g to escape in insert mode
inoremap <C-g> <Esc>
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
"nmap <CR> $a<CR><Esc>
""handle quickfix window
nmap <F6> :cp<cr>
nmap <F7> :cn<cr>

" Smart way to move between windows (included in minibufexpl.vim)
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
set cmdheight=2 "set cmdline height to 2
set laststatus=2 " show status bar (default is 1, can not display status bar)


"set status bar (uncomment the next line, if don't use powerline)
"set statusline=%F\ %m\ %r\ \ \ ASCII=%b,HEX=%B\ \ \ %=line:%-03l/%-03L\ col:%-03c\ %p%%\ \ \ %{strftime(\"%Y-%m-%d\ %H:%M\")}
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
"g<C-g> vim自带

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
""                     pyflakes
""------------------------------------------------------------
let g:pyflakes_use_quickfix = 0  " do not use quick fix window

