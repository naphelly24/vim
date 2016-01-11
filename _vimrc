" => Vundle prerequisites {{{
set nocompatible " Use Vim settings, rather than VI settings. This must be first, because it changes other options as a side effect.
filetype off " required by vundle
"}}}

" => environment {{{
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif
" }}}

" => auto execute {{{
" transparent the windows a little bit
if has('win32') || has('win64')
    autocmd VimEnter * call libcallnr("vimtweak.dll", "SetAlpha", 250)
endif
" When opening a file, jump to the last cursor position.
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
" }}}

" => Bundle setup {{{
" NOTE: comments after Bundle command are not allowed..
" set the runtime path to include Vundle and initialize
set rtp+=$VIMFILES/bundle/Vundle.vim
call vundle#begin($VIMFILES.'/vundle_plugins')
" let Vundle manage Vundle, required!
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'a.vim'
Plugin 'vimwiki'
Plugin 'richardlee8681/calendar-vim'
Plugin 'IndexedSearch'
Plugin 'taglist.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bufexplorer.zip'
Plugin 'mru.vim'
Plugin 'YankRing.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'matchit.zip'
Plugin 'kien/ctrlp.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'Raimondi/delimitMate'
Plugin 'docunext/closetag.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kevinw/pyflakes-vim'
Plugin 'hdima/python-syntax'
call vundle#end() "required
" }}}

" => General Settings {{{
set history=256
filetype plugin indent on
set autoread " Set to auto read when a file is changed from the outside
let mapleader = ','
let g:mapleader = ','
" Fast saving
nmap <leader>w :w!<cr>

set nospell
set confirm
set clipboard+=unnamed " share clipboard with windows
set colorcolumn=81
"hi colorcolumn guibg=lightgreen
" persistent undo
set undofile
set undodir=$VIMFILES/\_undodir " you should create _undodir first!
set undolevels=1000 "maximum number of changes that can be undone"

" Use spaces instead of tabs
set listchars=tab:->,trail:-

set bsdir=buffer
set autochdir

set nu "line number


" set folding
set foldenable
set foldmethod=marker
"set foldlevel=99 "no folding by default

""cursor tracking (this feature gives quite a slowdown when scrolling through the file)
"set cursorcolumn
"set cursorline
"hi cursorline guibg=#333333     " highlight bg color of current
" auto load vimrc if modified
if has('win32') " load vimrc when being modified
    autocmd! bufwritepost _vimrc source %
else
    autocmd! bufwritepost .vimrc source %
endif

" close preview window after leaving insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"}}}

" => Vim user interface {{{
set scrolloff=3 " Set 3 lines to the cursor - when moving vertically using j/k
set wildmenu " turn on wild menu, try typing :h and press <Tab>
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif
set ruler " show the cursor position all the time
set cmdheight=2 "set cmdline height to 2
set hid " allow to change buffer without saving
set backspace=indent,eol,start whichwrap+=<,>,h,l
if has('mouse')
    set mouse=a
endif
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw " do not redraw while executing macros (much faster)
set magic
set showmatch
set mat=2 " How many tenths of a second to blink when matching brackets
set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1 " Add a bit extra margin to the left

set showcmd	" display incomplete commands
set shortmess=atI " shortens messages to avoid 'press a key' prompt and no ad when launch vim
set display+=lastline " for easy browse last line with wrap text
set laststatus=2 " show status bar (default is 1, can not display status bar)
set showfulltag " show tag with function prototype

set go=
set go+=r
set go+=R
"}}}

" => Colors, Encoding and Fonts {{{
syntax on " Enable syntax highlighting
try
    colorscheme molokai
catch
endtry

set background=dark

"" encoding
set encoding=utf-8
"set termencoding=chinese
set termencoding=cp936
"set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,cp936
set shortmess=atI
set fileencodings=ucs-bom,utf-8,cp936
if has('win32') || has('win64')
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    set langmenu=zh_CN.UTF-8
    language messages zh_CN.UTF-8
endif
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif
set nobomb
" Use Unix as the standard file type
"set ffs=unix,dos,mac

"Font setting
if has('win32') || has('win64')
    set guifont =Consolas:h12
    set guifontwide=Microsoft\ YaHei:h12
    nmap ml :set guifont =Consolas:h16<CR>:set guifontwide=SimSun:h16<CR>
    nmap mn :set guifont =Consolas:h12<CR>:set guifontwide=SimSun:h12<CR>
    nmap ms :set guifont =Consolas:h10<CR>:set guifontwide=SimSun:h10<CR>
elseif has('mac')
    set guifont=Monaco:h14
endif
" }}}

" => Files, backups and undo {{{
set nobackup
set nowb
set noswapfile
"}}}

" => Text, tab and indent related {{{
set expandtab " use spaces instead of tabs
set smarttab " Be smart when using tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
"set textwidth=80
set autoindent "Auto indent
set si "Smart indent
set wrap "Wrap lines
"}}}

" => Visual mode related {{{
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
"}}}

" => key binding {{{
" Remap VIM 0 to first non-blank character
map 0 ^ 
"" use Ctrl+g to escape in insert mode
inoremap <C-g> <Esc>
nmap <C-cr> :only<CR>

" enter DEBUG
"imap <leader>p print "DEBUG_HERE"<CR>
"map <leader>p iprint "DEBUG_HERE"<CR>

" replace a word with the word in default register, <C-y><C-e> is used to add some delay
nmap <leader>r Plde<C-y><C-e><C-y><C-e><C-y><C-e>bye

"quick way to add something
"add line breaks in the next line
nmap <leader>= yypVr=
nmap <leader>- yypVr-

"Make <CR> insert a new line in normal mode
"nmap <CR> $a<CR><Esc>
""handle quickfix window
"nmap <F6> :cp<cr>
"nmap <F7> :cn<cr>

" Smart way to move between windows (included in minibufexpl.vim)
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

nmap <leader>s :source $MYVIMRC<CR>
nmap <leader>e :e $MYVIMRC<CR>


" date/time info quick insert
nnoremap <leader>d "=strftime("%Y-%m-%d/%H:%M:%S")<CR>gP
inoremap <leader>d <C-R>=strftime("%Y-%m-%d/%H:%M:%S")<CR>

" Set Up and Down non-linewise
"noremap k gk
"noremap j gj

" enter <br> in insert mode
imap <S-CR> <br><CR>

" delete space at end
map <leader><space> :call HandleSpace()<CR>
func! HandleSpace()
	:%s/\s\+$//
endfunc

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" map <F5> <Esc>:w<CR>:!cl.bat %<CR>
" imap <F5> <Esc>:w<CR>:!cl.bat %<CR>

" command mode inhense
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Map ; to : and save a million keystrokes
nnoremap ; :

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


map ,cp :vertical diffsplit
imap ,cp <ESC>:vertical diffsplit

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" }}}

"" => behave like MS-Windows {{{
"" Most are copied from mswin.vim
"" Set options and add mapping such that Vim behaves a lot like MS-Windows
"behave mswin
"" backspace in Visual mode deletes selection
"vnoremap <BS> d

"" CTRL-X and SHIFT-Del are Cut
"vnoremap <C-X> "+x
"vnoremap <S-Del> "+x

"" CTRL-C and CTRL-Insert are Copy
"vnoremap <C-C> "+y
"vnoremap <C-Insert> "+y

"" CTRL-V and SHIFT-Insert are Paste
"map <C-V>		"+gP
"map <S-Insert>		"+gP

"cmap <C-V>		<C-R>+
"cmap <S-Insert>		<C-R>+

"exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

"imap <S-Insert>		<C-V>
"vmap <S-Insert>		<C-V>

"" Use CTRL-Q to do what CTRL-V used to do
"noremap <C-Q>		<C-V>

"" CTRL-A is Select all
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
"cnoremap <C-A> <C-C>gggH<C-O>G
"onoremap <C-A> <C-C>gggH<C-O>G
"snoremap <C-A> <C-C>gggH<C-O>G
"xnoremap <C-A> <C-C>ggVG
"" }}}

" => set status bar (uncomment the next line, if don't use air-line) {{{
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
" }}}

" => Windows size initially {{{
if has('gui_running') && has('win32')
    "maximize the window
    au GUIENTER * simalt ~x
    "winpos 0 0
    "set lines=30
    "set columns=100
else
    " winpos 0 0
    " set lines=120
    " set columns=200
endif
" }}}

" => set transparent {{{
if has('mac') && has('gui_running')
	set transparency=5
	nmap ts : set transparency=11<CR>
	nmap Ts : set transparency=0<CR>
else
	nmap ts : call libcallnr("vimtweak.dll", "SetAlpha", 200)<CR>
	nmap Ts : call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
endif
" }}}

" => Plugins {{{
" taglist.vim {{{
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
" }}}

" nerdcommenter.vim {{{
let NERDCompactSexyComs=1
" }}}

" NERD_tree.vim {{{
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
" }}}

" vimwiki {{{
""------------------------------------------------------------
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{'path': $VIMFILES . '/vimwiki/',
            \ 'path_html': $VIMFILES . '/vimwiki/html/',
            \ 'template_path': $VIMFILES .'/vimwiki/html/templates/',
            \ 'template_default': 'default',
            \ 'template_ext': '.html'}]
" do not remove my default.html (template) when executing :VimwikiAll2HTML
let g:vimwiki_user_htmls = 'default.html'
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_list_ignore_newline = 0
let g:vimwiki_menu = ''
"let g:vimwiki_folding = 'expr'
let g:vimwiki_w32_dir_enc = 'cp936'
let g:vimwiki_file_exts = 'c, cpp, txt, h, hpp, zip, sh, awk, ps, pdf'
"emacs org-mode like toggle
nmap <C-c><C-c> <Plug>VimwikiToggleListItem
nmap <F11> :Vimwiki2HTML<CR>
nmap <F12> :VimwikiAll2HTML<CR>
" }}}

" syntastic {{{
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
"let g:syntastic_python_pep8_args='--ignore=E501, E225,E124,E712'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 0
map <F7> <Esc>:w<CR>:Errors<CR>
" execute current python script
map <F5> <Esc>:w<CR>:!python %<CR>
imap <F5> <Esc>:w<CR>:!python %<CR>

" }}}

" calendar {{{
let g:calendar_weeknm = 1 " WK01
" }}}

" PerforceBlame {{{
fun! PerforceBlame()
"execute ":!python D:\\devtools\\python\\p4_introduced.py " .  bufname("%") . " " . line(".")
execute ":!python E:\\devtools\\python\\p4_introduced.py " .  bufname("%") . " " . line(".")
endfun
nmap <leader>pb :call PerforceBlame()<cr>
" }}}

" YankRing {{{
let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'
" }}}

" vim-indent-guides {{{
"let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
" }}}

" YouCompleteMe {{{
""------------------------------------------------------------
if has('win32') || has('win64')
    let g:ycm_global_ycm_extra_conf='c:/Program Files (x86)/Vim/vim74/.ycm_extra_conf.py'
endif
let g:ycm_complete_in_comments=1 " Completion in comments
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
"let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_collect_identifiers_from_tags_files=1 " Let YCM read tags from Ctags file
set completeopt=longest,menu
"let g:ycm_min_num_of_chars_for_completion=1
"let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming
"language's keyword
"let g:ycm_key_invoke_completion = '<M-;>'
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
nmap <C-]> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>

"let g:ycm_enable_diagnostic_signs = 0
" }}}

" Ultisnips {{{
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" }}}

" closetag {{{
let g:closetag_html_style=1
" }}}

" ctrlp {{{
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
" }}}

" rainbow_parentheses {{{
" exclude this line because black is not easy to recognize
" \ ['black',       'SeaGreen3'],
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}
" }}}
