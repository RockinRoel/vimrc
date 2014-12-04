" geen vi-compatible mode, alle vim features
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " Vundle, duh!
Plugin 'scrooloose/nerdtree' " NERDTree
Plugin 'kien/ctrlp.vim' " Ctrl-P for quick fuzzy file opening
Plugin 'majutsushi/tagbar' " tagbar
" Plugin 'scrooloose/syntastic' " Syntastic!
Plugin 'vim-scripts/AnsiEsc.vim' " AnsiEsc (interpret ANSI color escape sequences)
Plugin 'flazz/vim-colorschemes' " More colorschemes
Plugin 'vim-scripts/ScrollColors' " Scroll through colorschemes with :SCROLL
Plugin 'derekwyatt/vim-scala' " Scala syntax support
Plugin 'derekwyatt/vim-fswitch' " Switch between cpp and h files
Plugin 'tpope/vim-fugitive' " Fugitive! Git + Vim goodness
Plugin 'tpope/vim-surround' " Surround
Plugin 'tpope/vim-repeat' " . support in more plugins (including surround)
" Plugin 'ervandew/supertab' " SuperTAB
Plugin 'benmills/vimux' " Vim<->Tmux interaction
Plugin 'tejr/vim-tmux' " .tmux.conf syntax support
Plugin 'christoomey/vim-tmux-navigator' " ctrl-hjkl
Plugin 'mileszs/ack.vim' " Use ack from vim!
Plugin 'krisajenkins/vim-projectlocal' " Project local .vimrc files
Plugin 'Lokaltog/vim-powerline' " Fancy status lines
Plugin 'dahu/vim-asciidoc' " asciidoc support
Plugin 'elzr/vim-json' " Better JSON support
Plugin 'Valloric/YouCompleteMe' " You Complete Me
Plugin 'Konfekt/FastFold' " Fast fold for faster reading of large files

call vundle#end()
filetype plugin indent on

" Tabs and indenting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
" syntax highlighting
syntax on
" ruler beneden in beeld
set ruler
" highlight zoekresultaten
set hlsearch
" incremental search
set incsearch
" case insensitive
set ignorecase
" behalve als hoofdletter in zoekwoord
set smartcase
" bar completion
set wildmenu
" toon huidig commando in ruler
set showcmd
" toon huidige modus in ruler
set showmode
" toon zoekresultaten
set showmatch
set matchtime=3
" toon dialoogbox als commando mislukt
set confirm
" toon linenumbers
set number
" geef bepaalde files minder voorkeur bij filename completion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.out,.toc
" weg met de welkom message
set shortmess=aTI
" normale werking backspace
set backspace=indent,eol,start
" plaats cursor niet op begin van lijn bij PgUp/PgDown
set nostartofline
" muis overal gebruiken
set mouse=a
" lees veranderd bestand automatisch
set autoread
" zet shell op bash
set shell=bash

" Gebruik displayed lines voor j en k
nnoremap j gj
nnoremap k gk

" make Y yank to end of line instead of whole line,
" to be consistent with C and D
nnoremap Y y$

" Meerdere indendaties van visual block
vnoremap < <gv
vnoremap > >gv

" Automatisch herladen .vimrc
autocmd! bufwritepost .vimrc source %

function! SetWtCppFileType()
    if &syntax ==? ""
        set syntax=cpp
        set filetype=cpp
    endif
endfunction

" Automatically set C++ syntax for Wt files
autocmd! BufRead,BufNewFile,BufEnter,BufWinEnter,FileReadPost */src/Wt/* call SetWtCppFileType()

set tags+=~/.vim/tags/wt.tags

if ! has("gui_running")
  set t_Co=256
  set t_ut=
endif
set background=dark
colors Monokai

" Make sure we don't put byte order marks in files
set nobomb

set modeline
set laststatus=2

set background=dark

" Faster leader timeout
set timeoutlen=300

" Sort paragraph case-insensitively by placing the cursor
" over it, and typing <Leader>s. Useful for sorting a block of includes.
nnoremap <Leader>s vip:sort i<CR>

function! ActivateAsciiDoc()
	setlocal syntax=asciidoc
	setlocal filetype=asciidoc
	nnoremap <Leader>r :silent !asciidoc %<CR><C-l>
	setlocal spelllang=
endfunction

" Run asciidoc
autocmd! BufRead,BufNewFile,BufEnter,BufWinEnter,FileReadPost *.doc call ActivateAsciiDoc()
autocmd! BufRead,BufNewFile,BufEnter,BufWinEnter,FileReadPost *.adoc call ActivateAsciiDoc()
autocmd! BufRead,BufNewFile,BufEnter,BufWinEnter,FileReadPost *.asciidoc call ActivateAsciiDoc()

set foldmethod=syntax
set foldlevel=99

let g:syntastic_cpp_include_dirs = ['/home/roel/project/wt/src', '/home/roel/local/include', '/opt/software/boost_1_54_0/include', '/home/roel/project/wt/src/web']
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall -Werror=return-type'

" Set VimCrypt to use Blowfish instead of the weaker default
set cm=blowfish

let g:ycm_extra_conf_globlist = ['~/project/iLoc/iloc/.ycm_extra_conf.py','~/project/iLoc/iloc-engine/.ycm_extra_conf.py']
