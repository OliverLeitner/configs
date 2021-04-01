set nocompatible
autocmd GUIEnter * simalt ~x "maximize to fullscreen
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('c:/tools/vim/plugins/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'will133/vim-dirdiff'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
""Plugin 'heavenshell/vim-tslint'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'ap/vim-css-color'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
"Plugin 'rust-lang/rust.vim'
Plugin 'PProvost/vim-ps1.git'

" let Vundle manage Vundle, required
" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on
syntax on
set ruler
set number
set relativenumber
set nowrap
set autochdir
set ignorecase
set smartcase
set lazyredraw
set background=dark
set cursorline
set showcmd
set cmdheight=1
set showmode
set visualbell
set history=1000
set wildmenu
set backspace=2 " make backspace work like most other programs

set t_Co=256            " iTerm2 supports 256 color mode.

" Set to auto read when a file is changed from the outside
set autoread

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*,.code\*,.vscode\*,\.idea\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/.code,*/.vscode,*/.idea
endif

" A buffer becomes hidden when it is abandoned
set hid

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Use Unix as the standard file type
set ffs=unix,dos,mac

"indention for skidata
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set expandtab

set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set smartindent
set copyindent                  " copy the previous indentation on autoindenting

set showmatch                   " set show matching parenthesis
set scrolloff=999               " keep 4 lines off the edges of the screen when scrolling

set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type


" white space characters
set nolist
set listchars=eol:$,tab:.\ ,trail:.,extends:>,precedes:<,nbsp:_
highlight SpecialKey term=standout ctermfg=darkgray guifg=darkgray
" display white space characters with F3
nnoremap <F3> :set list! list?<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

set termencoding=utf-8
set encoding=utf-8
colorscheme predawn "github monokain rainbow_night Monokai

" read only mode per default
"set nomodifiable

"i prefer , as my leader key
let mapleader=","

"clear search on pressing ctrl-l
nnoremap <C-l>h :noh<CR>
inoremap <C-l>h :noh<CR>
vnoremap <C-l>h :noh<CR>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

if has('gui_running')
    set guifont=Consolas:h14:cANSI:cDEFAULT:qDEFAULT:qDRAFT "Inconsolata:h20:cANSI:qDEFAULT:qDRAFT
    "remove menu bar
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif

" https://github.com/alacritty/alacritty/issues/109
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif

" Behaviour
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/tmp/undo,~/.vim/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
"    who did ever restore from swap files anyway?
set directory=~/.vim/tmp
" store swap files in one of these directories
"    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
"    than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
"    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set nomodeline                  " disable mode lines (security measure)

"syntastic tunings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_typescript_checkers = ['tslint']
"let g:syntastic_javascript_checkers = ['eslint']

"airline enabling
let g:airline_powerline_fonts = 1

"tslint auto on save
"autocmd BufWritePost *.ts,*.tsx call tslint#run('a', get_winid())

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"display extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
augroup WhitespaceMatch
    " Remove ALL autocommands for the WhitespaceMatch group.
    autocmd!
    autocmd BufWinEnter * let w:whitespace_match_number =
        \ matchadd('ExtraWhitespace', '\s\+$')
    autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
    autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END
function! s:ToggleWhitespaceMatch(mode)
    let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
    if exists('w:whitespace_match_number')
        call matchdelete(w:whitespace_match_number)
        call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
    else
        " Something went wrong, try to be graceful.
        let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
    endif
endfunction

"ctrl+p ignore certain directories
let g:ctrlp_custom_ignore = {
            \ 'dir': 'tmp|\.git\|dist$|libs$|node_$|ch-$|\.svn\|\.idea\|\.code\|\.vscode\|'
\}

"new stuff
set ttyfast      "faster terminal updates

"# DirDiff settings
"# Don't compare directories or filenames that match conditions like CVS,*.swp
let g:DirDiffExcludes = "system,CVS,*.class,*.exe,.*.swp,.idea,.svn,dist,node_modules"
"# Ignore lines that Id:,Revision: etc.
let g:DirDiffIgnore = "Id:,Revision:,Date:"
"# Don't flag files as different based on whitespace
let g:DirDiffAddArgs = "-w"
"# au FilterWritePre * if &diff is to properly catch the transition to diff mode
"# When in diff mode map space bar to go down to next diff and center the page (z.). Shift-space to go up a diff
"au FilterWritePre * if &diff | exe 'noremap <space> ]cz.' | exe 'noremap <S-space> [cz.' | endif
"# When in diff mode convenience map diffput and diffget
"au FilterWritePre * if &diff | exe 'noremap <leader>g :diffget<CR>' | exe 'noremap <leader>p :diffput<CR>' | endif
"# When in diff mode convenience map undoing a diffput. Don't go without this one as it is a 3 step process.
"au FilterWritePre * if &diff | exe 'nmap <leader>u :wincmd l<CR>:normal u<CR>:wincmd h<CR>' | endif
"# When in diff mode suppress annoying auto-folding (filler,context:1000) and don't check for white space differences
"au FilterWritePre * if &diff | exe 'set diffopt=filler,context:1000,iwhite' | exe 'execute "normal \<c-w>\<c-w>"' | endif
"# Properly ignoring case and white space differences needs
"# to be done with the MyDiff function -- explanation can be found with
"# a quick search
set diffexpr=MyDiff()
function MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "--ignore-all-space "
   endif
   silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
    \  " > " . v:fname_out
endfunction
"# End DirDiff settings

"rust codepen
let g:rust_clip_command = 'xclip -selection clipboard'

"ag search thingy
"let g:ag_prg="<custom-ag-path-goes-here> --vimgrep"

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

packload
