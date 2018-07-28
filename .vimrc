call plug#begin('~/.vim/plugged')
 
 Plug 'MattesGroeger/vim-bookmarks'
 highlight BookmarkSign ctermbg=NONE ctermfg=160
 highlight BookmarkLine ctermbg=194 ctermfg=NONE
 let g:bookmark_sign = '⚑'
 let g:bookmark_highlight_lines = 1

 "Plug 'Valloric/YouCompleteMe'
 "let g:ycm_python_binary_path = 'python'
 "let g:ycm_seed_identifiers_with_syntax = 1
 "let g:ycm_min_num_of_chars_for_completion = 1
 "let g:ycm_autoclose_preview_window_after_completion=1
 "let g:ycm_auto_trigger = 1

 Plug 'davidhalter/jedi-vim'
 let g:jedi#popup_on_dot = 0
 let g:jedi#show_call_signatures = "1"

 Plug 'vim-scripts/vim-auto-save'
 let g:auto_save = 1
 let g:auto_save_no_updatetime = 0
 let g:auto_save_in_insert_mode = 1
 let g:auto_save_silent = 1

 Plug 'munshkr/vim-tidal'
 Plug 'tikhomirov/vim-glsl'

call plug#end()

set omnifunc=syntaxcomplete#Complete "YCM ctrl+space fix attempt

" options
set number                  " line numbers on the left.
set nocompatible            " no vi compatibility.
set noexrc                  " don't use ~/.exrc config.
set cursorline              " highlight the current line.
set noerrorbells            " no audio bell aka beeping.
set novisualbell            " no visual bell aka blinking.
set incsearch               " search while typing.
set hlsearch                " highlight all search matches.
set mouse=a                 " use mouse to navigate the file.
set clipboard=unnamedplus   " enables in vim from gvim VISUAL y -> clipboard
"set paste                  " no incremented tabs per line from paste;
                            " commented to enable Vundle TAB completion.

set shell=/bin/bash  " shell to use.
syntax on            " color syntax highlighting.
filetype plugin on   " load the filetype specific config.

" keys mapping
"map <F5> :w !python <CR>
map // y/<C-R>"<CR>         " search visually selected text

" indent options
set autoindent      " set indenting.
set ts=4            " set tab space.
set sw=2            " set soft tab.
set tabstop=4       " tab equals to n spaces.
set expandtab       " expand a tab to spaces.
set shiftwidth=4    " set autoindent to one tab.
set colorcolumn=80  " vertical column for text width.

" color options
"colorscheme elflord
"colorscheme slate
"colorscheme onehalfdark

set t_Co=256
colorscheme desert
" changes to colorscheme
hi ColorColumn ctermbg=white
hi CursorLine ctermbg=none    cterm=none
hi CursorLineNr ctermfg=255
hi LineNr ctermfg=DarkGrey cterm=none
hi Search cterm=NONE ctermfg=white ctermbg=DarkGrey

" Make vim recognize Y86 assembly files
:autocmd BufNewFile,BufRead *.ys set ft=asm
":autocmd BufNewFile,BufRead *.ys set nosmartindent
