set nocompatible
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
"source $VIMRUNTIME/mswin.vim
"set dictionary=$VIM/words.dic
"press <C-x> <C-k> to complete your word in words.di

"behave mswin

"set diffexpr=MyDiff()
"function MyDiff()
 "let opt = '-a --binary '
 "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
 "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
 "let arg1 = v:fname_in
 "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
 "let arg2 = v:fname_new
 "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
 "let arg3 = v:fname_out
 "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
 "let eq = ''
 "if $VIMRUNTIME =~ ' '
   "if &sh =~ '\<cmd'
	 "let cmd = '""' . $VIMRUNTIME . '\diff"'
	 "let eq = '"'
   "else
	 "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
   "endif
 "else
   "let cmd = $VIMRUNTIME . '\drff'
 "endif
 "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

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
    set guifont =Monaco:h12<CR>
    nmap ml :set guifont =Monaco:h12<CR>
    nmap mn :set guifont =Monaco:h15<CR>
    nmap ms :set guifont =Monaco:h17<CR>
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
set go=
set go+=r
set go+=R
""隐藏工具栏set guioptions-=T
""隐藏菜单栏set guioptions-=m
""隐藏左边滚动条 set guioptions-=l set guioptions-=L
""隐藏右边滚动条 set guioptions-=r set guioptions-=R
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
"set lbr
"set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set nu "line number
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


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap ,s :source $MYVIMRC<CR>
nmap ,e :e $MYVIMRC<CR>

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

"automatically change directory, important for nerdtree plugin
"This setting conflicts with many plugins
set bsdir=buffer
set autochdir


"set cmdline height to 2, which looks cool
set cmdheight=2
"set status bar
set laststatus=2            " show status bar (default is 1, can not display status bar)
set statusline=%f\ %m\ %r\ \ \ ASCII=\%b,HEX=\%B\ \ \ %=\ln:%-03l/%-03L\ col:%-03c\ %p%%\ \ \ %{strftime(\"%Y-%m-%d\ %H:%M\")}
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


" <F10> delete space at end
map <F10> :call HandleSpace()<CR>
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
   nmap <F11> <Esc>:call libcallnr("vimtweak.dll", "EnableMaximize", 1)<CR>
   nmap <F12> <Esc>:call libcallnr("vimtweak.dll", "EnableMaximize", 0)<CR>
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
""Requires plugin/NERD_commenter.vim
""----------------------------------------------------
"""----------------------------------------------------
"""		  neocomplcache.vim
"""----------------------------------------------------
"" Disable AutoComplPop.
""let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
""let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
""inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
""inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
""inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
""inoremap <expr><C-y>  neocomplcache#close_popup()
""inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
"" AutoComplPop like behavior.
""let g:neocomplcache_enable_auto_select = 1
"
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


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
set cc=80
""------------------------------------------------------------
""use mouse anywhere in the window
"if has('mouse')
"	set mouse=a
"	set selection=exclusive
"	set selectmode=mouse,key
"endif
"
"" no ad when launch vim
set shortmess=atI

" fold {{{
"用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
"set foldenable
set fdm=indent
"don't autofold anything (but I can still fold manually)
"set foldlevel=100
"set foldopen -=search don't open folds when search into them
"set foldopen -=undo
"fdm=expr: fde=getline(v\:lnum)=~'.'?1\:0: foldtext=foldtext().v\:folddashes.getline(v\:foldstart+1): foldcolumn=2
"去除空行
"set foldexpr=getline(v:lnum)=~'\\S'&&getline(v:lnum-1)!~'\\S'?'>1':'='
"au FileType fuck set fdm=expr | foldexpr=getline(v:lnum)=~'^\\S!'&&getline(v:lnum-1)!~'\\S'?'>1':'='
"au FileType txt,vim,lisp set fdm=expr | set fde=getline(v\:lnum)=~'.'?1:0
			"\ | set foldtext=foldtext().v:folddashes.getline(v:foldstart+1)
			"\ | set foldcolumn=1
"au FileType cpp,c,java set foldmethod=syntax | set foldcolumn=2
"au FileType perl,tex,php,html,css,sh set foldmethod=indent
			"\ | set foldcolumn=2
"nmap <leader>fc :set foldcolumn=1<cr>
"nmap <leader>fC :set foldcolumn=0<cr>
"}}}


"" This is useful when two lines is combined without a space
"map <leader>j gJdw

"" use jj to escape in insert mode
"inoremap jj <Esc>
