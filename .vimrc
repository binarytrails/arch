" random options
set number          "line numbers on the left
set nocompatible    "no vi compatibility
set noexrc          "don't use ~/.exrc config
set cursorline      "highlight the current line
set noerrorbells    "no audio bell aka beeping
set novisualbell    "no visual bell aka blinking
set incsearch       "search while typing
set hlsearch        "highlight all search matches
set mouse=a         "Use mouse to navigate the file

" keys mapping
map <F5> :w !python <CR>

" indent options
set autoindent      "set indenting
set ts=4            "set tab space
set sw=2            "set soft tab
set tabstop=4       "tab equals to n spaces
set expandtab       "expand a tab to spaces
set shiftwidth=4    "set autoindent to one tab
set colorcolumn=80  "vertical column for text width

" more random options
set shell=/bin/bash  "shell to use
syntax on            "color syntax highlighting
filetype plugin on   "load the filetype specific config

" color options
set t_Co=256
"colorscheme elflord
colorscheme desert
"colorscheme slate

" changes to colorscheme
hi ColorColumn ctermbg=234
hi CursorLine ctermbg=234    cterm=none
hi CursorLineNr ctermfg=255
hi LineNr ctermfg=DarkGrey cterm=none
hi Search cterm=NONE ctermfg=white ctermbg=DarkGrey

" Make vim recognize Y86 assembly files
:autocmd BufNewFile,BufRead *.ys set ft=asm
":autocmd BufNewFile,BufRead *.ys set nosmartindent

" latex plugin
"filetype plugin indent on

