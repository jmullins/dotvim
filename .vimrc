set nocompatible              "Turn off vi compatibility
filetype off                  "Required for vundle section  

"Use vundle to manage plugins
":BundleList - list configured bundles
":BundleInstall - install(update) bundles
":BundleSearch foo - search for foo
":BundleClean - remove unused bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Let vundle manage vundle (required)
Bundle 'gmarik/vundle'
"github.com/vim-scripts/* repos
Bundle 'pep8'
Bundle 'Wombat'
Bundle 'wombat256.vim'
"github repos
Bundle 'nanotech/jellybeans.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'fs111/pydoc.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
"other repos
Bundle 'git://repo.or.cz/vcscommand'

filetype plugin indent on

"Display
syntax on                
set nu                         "Line numbers on 
set showmatch                  "Show matching braces / brackets
set vb                         "Visual bell
set mouse=a                    "Enable mouse always

"Colors
if has('gui')
    colorscheme wombat
elseif &t_Co >= 256
    colorscheme wombat256mod
else
    set background=light
endif

"Formatting
set autoindent                 "Indent at same level of the previous line
set cindent                    "Smarter indentation
set et                         "Expand tabs to spaces
set sw=4                       "Use idents of 4 spaces
set tpm=20                     "Max number of tabs
set ts=4                       "Indentation every four columns
set nowrap                     "Line wrapping off


" Misc
set autowrite                  "Save file when changing files
set pastetoggle=<F7>           "Paste toggle for sane pastes


"Wild menu
set wildmenu                   "Tab complete list
set wildmode=list:longest,full "List matches, then lognest common part, then all.


"Command line 
if has('cmdline_info')
    set ruler                   "Ruler on
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif


"Status line
if has('statusline')
    set laststatus=2                          "Always show status line
    set statusline=%<%f\                      "Filename
    set statusline+=%w%h%m%r                  "Options
    set statusline+=%{fugitive#statusline()}  "Git status
    set statusline+=\ [%{&ff}/%Y]             "filetype
    set statusline+=\ [%{getcwd()}]           "current dir
    "set statusline+=\ [A=\%03.3b/H=\%02.2B]  "ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%   "Right aligned file nav info
endif


"The default leader is '\', but prefer ','
let mapleader = ','


"Tab navigation
"map <C-R> :tabnext <CR>
"map <C-U> :tabprevious <CR>
"map <C-F> :tabfind 


"Window move remappings
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_


"Ctags
"Search current directory back to root for tags, and also home directory
set tags=./tags;/,$HOME/tags
map <F6> :!ctags --python-kinds=-i -R -f ~/tags $VIRTUAL_ENV `pwd` <CR>


"Autocomplete
"Auto open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest "Autocomplete

"Supertag plugin
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
    \ endif

"Minibuf Explorer Plugin
let miniBufExplForceSyntaxEnable = 1

"Tagbar pluign
map <leader>tb :TagbarToggle <CR>


"Map control-space to autocomplete menu in insert mode
imap <Nul> <C-R>=RopeCodeAssistInsertMode()<CR>
map <Leader>rad :RopeShowDoc<CR>
map <leader>raj :RopeGotoDefinition<CR>
map <leader>rar :RopeRename<CR>


"Pydoc plugin
let g:pydoc_cmd = "python -m pydoc"
"let g:pydoc_open_cmd = 'tabnew'


"Syntastic plugin
let g:syntastic_javascript_jslint_conf = "--es5=false --white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"

"NERDTree plugin
map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
map <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1


"PEP 8 (Style Guide for Python Code) Plugin
let g:pep8_map='<leader>8'

"Below is needed to make Python omnicomplete work with virutalenv's and
"django. Django imports will fail if env variables DJANGO_SETTINGS_MODULE
"is not present.
if has('python')
python << EOF
import os
import sys
import vim

DJANGO_SETTINGS_MODULE='settings'

virtualenv  = os.getenv('VIRTUAL_ENV')
if virtualenv:
    sys.path.insert(0, virtualenv)
    
    activate_this = os.path.join(virtualenv, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    
    os.environ['DJANGO_SETTINGS_MODULE'] = DJANGO_SETTINGS_MODULE
EOF
endif
