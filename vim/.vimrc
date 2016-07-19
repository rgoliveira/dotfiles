"-------------------------------------------------------------------------------
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: rgoliveira.com
" Description:  My personal .vimrc.
"               Based off http://vim.wikia.com/wiki/Example_vimrc
"-------------------------------------------------------------------------------

" init {{{1

" manually run pathogen file
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()

" Themes {{{1

if has('gui_running')
  colorscheme Tomorrow-Night-Eighties
  let g:airline_theme = 'tomorrow'
else
  colorscheme slate
  let g:airline_theme = 'wombat'
endif

" NeoVim {{{1

if has('nvim')
  set clipboard+=unnamedplus
endif

" }}}

" GUI specific {{{1

if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono
endif

" ultisnips {{{1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=["vim-snippets"]


" Airline (and extensions) {{{1

if has('gui_running')
  let g:airline#extensions#tabline#enabled = 1
endif

" Syntastic {{{1

" ps.: these are the recommend for new users, as in its github page
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" ctrlp {{{1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" ignore common folders/files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-table-mode {{{1

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

" emmet-vim {{{1

" use only for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css,handlebars,mustache EmmetInstall

" vim-javascript {{{1

let g:javascript_conceal_function   = "ƒ"
"let g:javascript_conceal_null       = "ø"
"let g:javascript_conceal_this       = "@"
"let g:javascript_conceal_return     = "⇚"
"let g:javascript_conceal_undefined  = "¿"
"let g:javascript_conceal_NaN        = "ℕ"
"let g:javascript_conceal_prototype  = "¶"
"let g:javascript_conceal_static     = "•"
"let g:javascript_conceal_super      = "Ω"

au BufRead,BufNewFile *.js call SetJSOptions()
function! SetJSOptions()
  setlocal foldmethod=syntax
  setlocal conceallevel=2
  " disable highligh for Conceal
  hi clear Conceal
endfunction

" calendar {{{1

let g:calendar_first_day = "sunday"
let g:calendar_time_zone = "-0300"
let g:calendar_date_endian = "little"
let g:calendar_view = "agenda"

" vimoutliner {{{1

let g:vo_fold_length = 'max'

" Filetype detection {{{1

" General {{{
" set *.md always as markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Delphi sources
au BufNewFile,BufRead *.pas,*.PAS set ft=delphi
" Delphi project file
au BufNewFile,BufRead *.dpr,*.DPR set ft=delphi
" Delphi form file
au BufNewFile,BufRead *.dfm,*.DFM set ft=delphi
au BufNewFile,BufRead *.xfm,*.XFM set ft=delphi
" Delphi package file
au BufNewFile,BufRead *.dpk,*.DPK set ft=delphi
"}}}
" .vimrc {{{
au BufNewFile,BufRead *vimrc call SetVimRCOptions()
function! SetVimRCOptions()
  setlocal foldmethod=marker
endfunction
"}}}
" C/C++ {{{
au FileType c,cpp call SetCOptions()
function! SetCOptions()
  setlocal foldmethod=syntax
  setlocal foldnestmax=1
endfunction
"}}}
" Autohotkey {{{
au FileType autohotkey call SetAHKOptions()
function! SetAHKOptions()
  setlocal foldmethod=marker
  setlocal foldnestmax=1
endfunction
" }}}
" Python {{{
au FileType python call SetPyOptions()
function! SetPyOptions()
  setlocal foldmethod=indent
  setlocal foldtext=substitute(getline(v:foldstart),'\\t','\ \ \ \ ','g')
  setlocal foldnestmax=1
  setlocal shiftwidth=4
endfunction
"}}}

" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Disable line wrapping
set nowrap

" Set sidescroll size to one char. In slow terminals, set to zero.
set ss=1

"-------------------------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left, relative to current line
set number
set rnu

" Use absolute numbers when in insert mode
au InsertEnter * set nornu
au InsertLeave * set rnu

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" F8 to toggle tagbar
nmap <F8> :TagbarToggle<CR>

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Fat fingers
nmap :Q :q
nmap :W :w

" (C)hange to (D)irectory of (C)urrent file
" command CDC cd %:p:h
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ,lcd :lcd %:p:h<CR>:pwd<CR>

" Utl.vim mappings
" follow file/web links
nnoremap ,go :Utl<cr>
" create ref link based on current word
nnoremap ,refl ciw<url:#r=<esc>pa><esc>

" In normal mode, arrow keys are used to navigate...
" buffers
nmap <Left> :bprevious<CR>
nmap <Right> :bnext<CR>
" tabs
nmap <Up> gT
nmap <Down> gt
" windows
nmap <C-Up> <C-W>k
nmap <C-Down> <C-W>j
nmap <C-Left> <C-W>h
nmap <C-Right> <C-W>l

" Use space to toggle folds
nnoremap <space> za
" In visual mode, create fold
vnoremap <space> zf

" Move lines up/down using Ctrl+Shift+j/k
nnoremap <C-S-j> :m .+1<CR>==
nnoremap <C-S-k> :m .-2<CR>==
inoremap <C-S-j> <Esc>:m .+1<CR>==gi
inoremap <C-S-k> <Esc>:m .-2<CR>==gi
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv
"------------------------------------------------------------

"------------------------------------------------------------
" Project specific options
set exrc
set secure
"------------------------------------------------------------
