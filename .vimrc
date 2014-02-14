" Kurt's .vimrc

" Use Vim settings, rather than Vi settings (much better!).
set nocompatible

" Settings
set encoding=utf-8
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlight the last used search pattern
set wildmenu            " command-line completion displays menu of matches
set smarttab            " <Tab> in front of a line inserts blanks = shiftwith
set expandtab           " insert space characters whenever tab key is pressed
" use <C-v><Tab> to insert tab character
set tabstop=2           " 2 spaces for every press of the tab key
" use :retab to change all the existing tab characters to match current
" tab settings
set shiftwidth=2        " 2 spaces for autoindent
set softtabstop=2       " 2 spaces inserted for tab
" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode
set backspace=indent    " if only indent is set, it breaks <C-w> and <C-u>
set backspace=eol
set backspace=start
set laststatus=2        " make airline show up
set ttimeoutlen=50      " make airline exit insert mode faster

" Lettings
let mapleader = ","
let g:airline_powerline_fonts = 1
let g:mustache_abbreviations = 1

" Start Pathogen to load plugins
execute pathogen#infect()

syntax enable           " switch syntax highlighting on

set t_Co=256            " enable 256 colors
" colorscheme wombat256mod

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Highlight extra whitespace except when in insert mode
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Move to next / previous line with same indentation
" http://vim.wikia.com/wiki/VimTip112
noremap <F7> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
noremap <F9> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" Open NERDTree automatically when vim starts if no files are specified
" autocmd vimenter * if !argc() | NERDTree | endif

" Only display the cursorline in the current window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Correctly set filetype to markdown syntax instead of Modula2 via
" tpope/vim-markdown
autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=markdown |
      \ else |
      \   setf markdown |
      \ endif

" Note: Cannot use comments on inoremap lines bc they are inserted as text
" Insert mode: First use Ctrl-g u to start a new change, providing an undo step
" inoremap <C-u> <C-g>u<C-u>
" inoremap <C-w> <C-g>u<C-w>
" Break undo at each line break & trigger abbreviation
inoremap <CR> <C-]><C-G>u<CR>

" map <F2> :NERDTreeToggle<CR>      " exactly what it sounds like
map <F10> :let @/ = ""<CR>        " clear search string to clear highlight

" Change DiffText highlight for legibility
highlight DiffText ctermbg=011 guibg=yellow
