set nocompatible " Use Vim settings, rather than VI settings. This must be first, because it changes other options as a side effect.

" => environment {{{
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif
" }}}

" => auto execute {{{
" transparent the windows a little bit
autocmd VimEnter * call libcallnr("vimtweak.dll", "SetAlpha", 250)
" When opening a file, jump to the last cursor position.
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
" }}}

" => Bundle setup {{{
" NOTE: comments after Bundle command are not allowed..
set rtp+=$VIMFILES\vundle
call vundle#rc($VIMFILES.'/vundle_plugins')
" let Vundle manage Vundle, required!
Plugin 'gmarik/vundle.vim'

Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdcommenter'
Plugin 'fs111/pydoc.vim'
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
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'YankRing.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'drmingdrmer/xptemplate' "code snippets
Plugin 'Solarized'
Plugin 'matchit.zip'
Plugin 'kien/ctrlp.vim' " Code and files fuzzy finder
Plugin 'gregsexton/MatchTag'
Plugin 'oplatek/Conque-Shell'

"Plugin 'sjl/gundo.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'wincent/Command-T'
"Plugin 'alfredodeza/pytest.vim'
"Plugin 'reinh/vim-makegreen'

"Plugin 'minibufexpl.vim'
" color scheme explorer
"Plugin 'sjas/csExplorer'
" Python and PHP Debugger
"Plugin 'fisadev/vim-debug.vim'
"Plugin 'vim-multiple-cursors'
"Plugin 'UltiSnips'
" }}}

" => Colors, Encoding and Fonts {{{
set background=dark
colorscheme solarized
filetype plugin indent on
syntax on " Enable syntax highlighting

"" encoding
set encoding=utf-8
set fenc=utf-8
set fileencodings=ucs-bom,utf-8,cp936
if has('win32') || has('win64')
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif
set nobomb
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
" }}}

" => General Settings {{{
set history=256
set autoread
set spell
set scrolloff=3 " Set 3 lines to the cursor - when moving vertically using j/k
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
"set textwidth=80
set colorcolumn=81
"hi colorcolumn guibg=lightgreen
set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500
set confirm
set clipboard+=unnamed " share clipboard with windows
set nobackup
" persistent undo
set undofile
set undodir=$VIMFILES/\_undodir " you should create _undodir first!
set undolevels=1000 "maximum number of changes that can be undone"

" Use spaces instead of tabs
set expandtab
set listchars=tab:->,trail:-
" Be smart when using tabs
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set autoindent "Auto indent
set si "Smart indent
"set wrap "Wrap lines
set nu "line number

set wildmenu " turn on wild menu, try typing :h and press <Tab>
set showcmd	" display incomplete commands
set ruler " show the cursor position all the time
set hid " allow to change buffer without saving
set shortmess=atI " shortens messages to avoid 'press a key' prompt and no ad when launch vim
set lazyredraw " do not redraw while executing macros (much faster)
set display+=lastline " for easy browse last line with wrap text
set cmdheight=2 "set cmdline height to 2
set laststatus=2 " show status bar (default is 1, can not display status bar)
set showfulltag " show tag with function prototype

set go=
set go+=r
set go+=R

" set folding
set foldenable
set foldmethod=marker
"set foldlevel=99 "no folding by default

""cursor tracking (this feature gives quite a slowdown when scrolling through the file)
"set cursorcolumn
"set cursorline
"hi cursorline guibg=#333333     " highlight bg color of current
" }}}

" => key binding {{{
let mapleader = ','
"" use Ctrl+g to escape in insert mode
inoremap <C-g> <Esc>
nmap <C-cr> :only<CR>

" execute current python script
"map <F5> <Esc>:w<CR>:!python %<CR>

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
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <leader>s :source $MYVIMRC<CR>
nmap <leader>e :e $MYVIMRC<CR>

set bsdir=buffer
set autochdir

" date/time info quick insert
nnoremap <leader>d "=strftime("%Y-%m-%d/%H:%M:%S")<CR>gP
inoremap <leader>d <C-R>=strftime("%Y-%m-%d/%H:%M:%S")<CR>

" Set Up and Down non-linewise
noremap k gk
noremap j gj

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

map <F5> <Esc>:w<CR>:!cl.bat %<CR>
imap <F5> <Esc>:w<CR>:!cl.bat %<CR>
" }}}

" => behave like MS-Windows {{{
" Most are copied from mswin.vim
" Set options and add mapping such that Vim behaves a lot like MS-Windows
behave mswin
set backspace=indent,eol,start whichwrap+=<,>,[,]
" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG
" }}}

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
    winpos 0 0
    "set lines=30
    "set columns=100
else
    winpos 0 0
    set lines=120
    set columns=200
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

" conque_term.vim {{{
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_StartMessages = 0
if has('win32') || has('win64')
    nmap sh :ConqueTerm powershell.exe<CR>
    nmap cm :ConqueTerm cmd<CR>
    "nmap cy :ConqueTerm c:/cygwin/bin/bash.exe --login -i<CR>
elseif has('mac')
    nmap sh :ConqueTerm bash<CR>
endif
func! OpenVSCmd()
    let vc_path='c:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/bin'

    :echo vc_path
endfunc

map <F2> :call OpenVSCmd()<cr>
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
let g:vimwiki_list = [{'path': 'D:\Baiduyun\Documents\vimwiki\',
            \ 'path_html': 'D:\Baiduyun\Documents\vimwiki\html\',
            \ 'template_path': 'D:\Baiduyun\Documents\vimwiki\templates\',
            \ 'template_default': 'def_template',
            \ 'template_ext': '.html'}]
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_menu = ''
let g:vimwiki_folding = 'expr'
let g:vimwiki_w32_dir_enc = 'cp936'
let g:vimwiki_file_exts = 'c, cpp, txt, h, hpp, zip, sh, awk, ps, pdf'
"emacs org-mode like toggle
nmap <C-c><C-c> <Plug>VimwikiToggleListItem
nmap <F11> :Vimwiki2HTML<CR>
"nmap <F12> :VimwikiAll2HTML<CR>
" }}}

" syntastic {{{
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501, E302'
"let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list=1
"map <F7> <Esc>:w<CR>:Errors<CR>
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
let g:ycm_global_ycm_extra_conf='.ycm_extra_conf.py'
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
"inoremap <leader>; <C-x><C-o>  " OmniCppComplete settings
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_invoke_completion = '<M-;>'
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
nmap <C-]> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" }}}
" }}}

set tag=d:/penguin/labview/branches/2013/dev/source/tags
