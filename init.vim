call plug#begin('~/.local/share/nvim/plugged')

" settings for deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" python source for deoplete
Plug 'zchee/deoplete-jedi'

" Python completion, goto definition etc.
Plug 'davidhalter/jedi-vim'

" snippet engine
Plug 'SirVer/ultisnips'

" snippet template for ultisnips
Plug 'honza/vim-snippets'

" fancy wim start screen
Plug 'mhinz/vim-startify'

" universal-ctags plugin
Plug 'majutsushi/tagbar'

" status line
Plug 'vim-airline/vim-airline'

" vim-airline theme
Plug 'vim-airline/vim-airline-themes'

" Full path fuzzy file, buffer, mru, tag, ...
Plug 'kien/ctrlp.vim'

" for insert mode completion
Plug 'ervandew/supertab'

" comment plugin
Plug 'scrooloose/nerdcommenter'

" auto format tool
Plug 'sbdchd/neoformat'

" auto pair insert and delete
Plug 'jiangmiao/auto-pairs'

" another auto pair plugin
Plug 'tpope/vim-surround'

" file explorer for vim
Plug 'scrooloose/nerdtree'

" syntax check and make
Plug 'neomake/neomake'

" multiline editting plugin
" Plug 'terryma/vim-multiple-cursors'

" highlight yanked region
Plug 'machakann/vim-highlightedyank'

" show git sign in vim
" Plug 'airblade/vim-gitgutter'

" quickly run a code script
Plug 'thinca/vim-quickrun'

" git in vim
" Plug 'tpope/vim-fugitive'

" modern matchit implementation
" Plug 'andymass/vim-matchup'

" indent object more easily
" Plug 'michaeljsmith/vim-indent-object'

" automatically toggle line number based on several conditions
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" JSON highlight plugin
" Plug 'elzr/vim-json'

" vim tabular plugin for manipulate tabular, required by markdown plugins
" Plug 'godlygeek/tabular'

" go vim
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" splitjoin
Plug 'AndrewRadev/splitjoin.vim'

" go development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" vim theme
Plug 'fatih/molokai'

" Enhanced Javascript syntax
Plug 'pangloss/vim-javascript'

" Generate JSDoc to your JavaScript code
" Plug 'othree/jspc.vim'

" HTML5 omnicomplete and syntax
Plug 'othree/html5.vim'

" Syntax for LESS
" Plug 'groenewege/vim-less'

" CSS3 syntax support to vim's built-in syntax/css.vim
" Plug 'hail2u/vim-css3-syntax'

" Vim syntax file for scss (Sassy CSS)
" Plug 'cakebaker/scss-syntax.vim'

" Updated built-in CSS complete with latest standards
" Plug 'othree/csscomplete.vim'

" Preview colors in source-code while editing
" Plug 'ap/vim-css-color'

" Superb development with Node.js
Plug 'moll/vim-node'

" React JSX syntax pretty highlighting
" Plug 'maxmellon/vim-jsx-pretty'

" Syntax Highlight for Vue.js components
Plug 'posva/vim-vue'

" cheat.sh
" Plug 'dbeniamine/cheat.sh-vim'

""""""""""""""""""""""""""""""" plugin settings """"""""""""""""""""""""""
call plug#end()

let mapleader = ','
set encoding=utf-8
set langmenu=zh_CN.UTF-8

" Python environment settings, see https://neovim.io/doc/user/provider.html#provider-python
" disable Python 2 support
" let g:loaded_python_provider=1
" let g:loaded_python3_provider=1

" path to Python 3 interpreter, make startup faster
" let g:python_host_prog = '/usr/bin/python2'
" let g:python3_host_prog='/usr/bin/python3'


""""""""""""""""""""""" deoplete settings""""""""""""""""""""""""""
" enable or disable deoplete auto-completion
" call deoplete#custom#option('auto_complete', v:true)

let g:deoplete#enable_at_startup = 1

" automatically close function preview windows after completion
" see https://goo.gl/Bn5n39
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete, see https://goo.gl/LvwZZY
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"  disable completion for comment and string
" call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" min character needed to start completion, see https://goo.gl/QP9am2
" call deoplete#custom#source('_', 'min_pattern_length', 3)

" auto select the first completion entry
" set completeopt+=noinsert

" completely disable the preview window during autocomplete process,
" see https://goo.gl/18zNPD for more info
" set completeopt-=preview

" candidate list item limit
" call deoplete#custom#option('max_list', 30)

"The number of processes used for the deoplete parallel feature.
" call deoplete#custom#option('num_processes', 16)

" Delay the completion after input in milliseconds.
" call deoplete#custom#option('auto_complete_delay', 10)

""""""""""""""""""""""""""""nerdcommenter settings"""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" use one space after # comment character in python,
" see https://github.com/scrooloose/nerdcommenter/issues/346#issuecomment-432705934
let g:NERDAltDelims_python = 1

" Align line-wise comment delimiters flush left instead
" of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


"""""""""""""""""""""""""supertab settings""""""""""""""""""""""""""
" auto-close method preview window
let g:SuperTabClosePreviewOnPopupClose = 1


""""""""""""""""""deoplete-jedi settings"""""""""""""""""""""""""""
" show doc string
let g:deoplete#sources#jedi#show_docstring = 1

" for large package, set autocomplete wait time longer
let g:deoplete#sources#jedi#server_timeout = 50

"""""""""""""""""""""""""""""" neomake settings """""""""""""""""""""""
" when writing or reading a buffer, and
" on changes in normal mode (after 0.5s; no delay when writing).
call neomake#configure#automake('nrw', 50)

" change warning signs, see https://goo.gl/eHcjSq
highlight NeomakeErrorMsg ctermfg=227 ctermbg=237
let g:neomake_warning_sign={'text': '!', 'texthl': 'NeomakeErrorMsg'}

" only enable pylint linter for python
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_javascript_enabled_makers = ['eslint']

" do not highlight columns, it works bad for sublimemonokai
" see https://goo.gl/wd68ex for more info
let g:neomake_highlight_columns = 1

"let g:neomake_python_pylint_maker = {
"  \ 'args': [
"  \ '-d', 'C0103, C0111',
"  \ '-f', 'text',
"  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
"  \ '-r', 'n'
"  \ ],
"  \ 'errorformat':
"  \ '%A%f:%l:%c:%t: %m,' .
"  \ '%A%f:%l: %m,' .
"  \ '%A%f:(%l): %m,' .
"  \ '%-Z%p^%.%#,' .
"  \ '%-G%.%#',
"  \ }

""""""""""""""""""""""" nerdtree settings """"""""""""""""""""""""""
" toggle nerdtree window and keep cursor in file window
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>:wincmd p<CR>
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ignore certain files and folders
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree

" reveal currently editted file in nerdtree widnow, see https://goo.gl/kbxDVK
nnoremap <silent><F10> :NERDTreeToggle %<CR>:wincmd p<CR>
nnoremap <silent><C-D> :NERDTreeFind%<CR>:wincmd p<CR>
" nnoremap <F10> :exe 'NERDTreeFind' <CR>

" exit vim when the only window is nerdtree window, see
" https://github.com/scrooloose/nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
"     \ b:NERDTree.isTabTree()) | q | endif

" automatically show nerdtree window on entering nvim,
" see https://github.com/scrooloose/nerdtree, but now the cursor
" is in nerdtree window, so we need to change it to the file window,
" extract from https://goo.gl/vumpvo
" autocmd VimEnter * NERDTree | wincmd l

" delete a file buffer when you have deleted it in nerdtree
let NERDTreeAutoDeleteBuffer = 1

" show current root as realtive path from HOME in status bar
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

" disable bookmark and 'press ? for help ' text
let NERDTreeMinimalUI=1

""""""""""""""""""""""" tagbar settings """"""""""""""""""""""""""
" shortcut to toggle tagbar window
nnoremap <silent> <C-K><C-T> :TagbarToggle<CR>

""""""""""""""""""""""" ctrlp settins  """"""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

"""""""""""""""""""""""""""vim-airline setting""""""""""""""""""""""
"set airline themes
let g:airline_theme='wombat'

" show tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" skip empty sections if nothing to show
" extract from https://vi.stackexchange.com/a/9637/15292
let g:airline_skip_empty_sections = 1

" show buffer number for easier switching between buffer
" see https://github.com/vim-airline/vim-airline/issues/1149
let g:airline#extensions#tabline#buffer_nr_show = 1

"make airline more beautiful, see https://goo.gl/XLY19H for more info
" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
" airline symbols

""""""""""""""""""neoformat settins"""""""""""""""""""""""
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
let g:neoformat_try_formatprg = 1
" runs all formatters for current buffer without tab to spaces conversion
let b:neoformat_run_all_formatters = 1
let b:neoformat_basic_format_retab = 0

augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END

nmap <leader>y :Neoformat<CR>



""""""""""""""""""""""""vim-go settings"""""""""""""""""""
let g:go_version_warning = 0

""""""""""""""""""""""""jedi-vim settings"""""""""""""""""""
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
" let g:jedi#use_splits_not_buffers = "right"


""""""""""""""""""""""""supertab settings"""""""""""""""""""
" use the default top to bottom way for scroll, see https://goo.gl/APdo9V
let g:SuperTabDefaultCompletionType = "<c-n>"

""""""""""""""""""""""""""quickrun settings"""""""""""""""""""""""""""""
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {
            \'_': {
            \'outputter/buffer/into': 1,
            \'outputter/buffer/name': '[Happy Coding!!!]',
            \'outputter/buffer/close_on_empty': 1,
            \'outputter/buffer/split': 'botright 8sp'},}
nnoremap<silent> <F9> :QuickRun<CR>

""""""""""""""""""""""""""deoplete-go settings"""""""""""""""""""""""""""""
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


"""""""""""""""""""""""""""""""""""options"""""""""""""""""""""""""""""""
" activate syntax
syntax on

" turn on plugin and indent for file types
filetype plugin indent on

" changing fillchars for folding, so there is no garbage charactes
set fillchars=fold:-,vert:\|

" paste mode toggle, it seems that neovim's bracketed paste mode
" does not work very well for now, so we use old paste mode
set pastetoggle=<F2>

" show current line cursor is in
" set cursorline

" split window below when creating new window
set splitbelow

"highlight python code
let python_highlight_all=1

" Time in milliseconds to wait for a mapped sequence to complete
" see https://goo.gl/vHvyu8 for more info
set timeoutlen=800

" clipboard settings, see https://goo.gl/YAHBbJ for more
" information
set clipboard+=unnamedplus

" do not create swap files
set noswapfile      " disable creating swapfiles, see https://goo.gl/FA6m6h

"general tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space

set showmatch " show matching bracket
set number " show line number
set relativenumber " show line number relative to current line

" character case related settings
set ignorecase " ignore case when searching
set smartcase " case sensitive when uppercase present

" encoding settings for vim
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set linebreak " line will break at predefined characters

set wildmode=list:longest,full " list all items and start selecting matches

" set a ruler at column 80 and also set its color
" see https://goo.gl/vEkF5i for more info
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" minimum lines to keep above and below cursor
set scrolloff=5

" use mouse to select window and resizing window, etc
set mouse=a

" do not show mode on last line because airline can show it already
set noshowmode

""""""""""""""""""""""" mapping settings """""""""""""""""""""""""
" paste above current cursor, see https://stackoverflow.com/a/1346777/6064933
nmap <leader>p o<ESC>p
" paste below current cursor
nmap <leader>P O<ESC>p

" fast save and close, halt time between pressing
" leader key and the following key should be short,
" or it will be interpreted as separate command.
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>Q :qa<CR>

" go to previous and next item in location list quickly
nmap [l :lnext<CR>
nmap ]l :lprevious<CR>

" go to previous and next item in quickfix list
nmap [q :cprevious<CR>
nmap ]q :cnext<CR>

" close location list or quickfix list when they are present,
" see https://goo.gl/uXncnS
nmap<silent> \x :windo lcl\|ccl<CR>

" toggle highlight search, see https://goo.gl/3H85hh
nnoremap <silent><expr> <Leader>hl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Do not use arrow key in vim, see https://goo.gl/s1yfh4
" disable arrow key for normal mode
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" disable arrow key for insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" better ESC in insert mode, see https://goo.gl/SSSW5v
inoremap jj <esc>

" insert new line below, see https://stackoverflow.com/a/16136133/6064933
nmap oo o<ESC>

" insert new line above
nmap OO O<ESC>

" yank from cursor to end of line, to be consistent with C, D
nnoremap Y y$

" move cursor based on physical lines not the actual lines.
nmap j gj
nmap k gk
nmap $ g$
nmap ^ g^
nmap 0 g0
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" resize windows using alt and h,j,k,l, inspiration from
" https://goo.gl/vVQebo (page bottom)
nnoremap <silent> <M-h> <C-w><
nnoremap <silent> <M-j> <C-W>-
nnoremap <silent> <M-k> <C-W>+
nnoremap <silent> <M-l> <C-w>>

" fast window switching, inspiration from
" https://stackoverflow.com/a/4373470/6064933
nnoremap <silent> <M-left> <C-w>h
nnoremap <silent> <M-right> <C-w>l
nnoremap <silent> <M-down> <C-w>j
nnoremap <silent> <M-up> <C-w>k

" continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://goo.gl/m1UeiT
vnoremap < <gv
vnoremap > >gv

" when completion menu is shown, use <enter> to select an item
" and do not add an annoying newline, otherwise, <enter> is just what it is,
" for more info , see https://goo.gl/KTHtrr and https://goo.gl/MH7w3b
inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))

" switching buffers quickly, extracted from vim-unimpaired
nnoremap [b :bp<cr> " go to previous buffer
nnoremap ]b :bn<cr> " go to next buffer

" reload init.vim quickly and give a message
nnoremap <silent> <leader>s :so $MYVIMRC<cr>
            \ :echom "Nvim config reloaded!"<cr>

" edit init.vim in a vertical split
nnoremap <silent> <leader>e :vnew $MYVIMRC<cr>

" delete a buffer and switching to another buffer, do not close the
" window, see https://goo.gl/Wd8yZJ
nnoremap <silent> \d :bprevious<CR>:bdelete #<CR>


""""""""""""""""""""""""""" NeoSolarized settings"""""""""""""""""""""""""
" let g:neosolarized_contrast = "high"
" let g:neosolarized_bold = 1
" let g:neosolarized_underline = 1
" let g:neosolarized_italic = 1
" colorscheme NeoSolarized


" change the color of popup menu for autocompletion
" extracted from spf13-vim, see https://goo.gl/frRXHP
highlight Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
highlight PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan
            \ ctermbg=lightgray cterm=NONE
highlight PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray
            \ ctermbg=darkcyan cterm=NONE

" change highlight color of matching bracket for better visual effects
" solution from https://stackoverflow.com/a/10746829/6064933
highlight MatchParen cterm=none ctermbg=green ctermfg=blue guibg=lightgreen

"""""""""""""""""""""""""""" vim-node settings """"""""""""""""""""""""""""
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

"""""""""""""""""""""""""""" vim-vue settings """"""""""""""""""""""""""""
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

"""""""""""""""""""""""""""" vim-go settings """"""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


augroup go
    autocmd!

    " Show by default 4 spaces for a tab
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

    " :GoBuild and :GoTestCompile
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

    " :GoTest
    autocmd FileType go nmap <leader>t  <Plug>(go-test)

    " :GoRun
    autocmd FileType go nmap <leader>r  <Plug>(go-run)

    " :GoDoc
    autocmd FileType go nmap <Leader>d <Plug>(go-doc)

    " :GoCoverageToggle
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

    " :GoInfo
    autocmd FileType go nmap <Leader>i <Plug>(go-info)

    " :GoMetaLinter
    autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

    " :GoDef but opens in a vertical split
    autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
    " :GoDef but opens in a horizontal split
    autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

    " :GoAlternate  commands :A, :AV, :AS and :AT
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

" cheat.sh vim config checkers
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_shell_checkers = ['shellcheck']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       auto command                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically save current file and execute it when pressing the <F9> key
" it is useful for small script
autocmd FileType python nnoremap <buffer> <F9> :exec 'w !python'
            \ shellescape(@%, 1)<CR>
autocmd FileType cpp nnoremap <F9> :w <CR> :!g++ -Wall -std=c++11 %
            \ -o %<&&./%<<CR>

" do not use smart case in command line mode
" extracted from https://goo.gl/vCTYdK
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" imap jj <esc>

" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" switching buffer
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" diable mouse
set mouse=""
