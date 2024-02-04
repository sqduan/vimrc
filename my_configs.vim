"----------------------------------------------------------------
" Personal used VIM configure file
"
" This is a VIM configuration file for my personal use which is
" based on the everforest color scheme. It includes settings for
" basic VIM feature and plug-ins, hope you like this.
"
" @author: Shiqi Duan
" @date:   2024-2-3
"----------------------------------------------------------------

" Set color scheme as everforest
colorscheme everforest
set background=dark
let g:everforest_background = 'medium'

" Remove the toolbar for gvim
:set guioptions -=m

" Set a column in 80 character
:set colorcolumn=80

" Set line number
:set nu

" Define the Leader key
:let mapleader = "\<tab>"

" Let backspace behave normally
:set backspace=indent,eol,start

" Give a highlight to
highlight VertSplit cterm=bold ctermfg=darkgrey ctermbg=none
highlight StatusLine cterm=bold ctermfg=darkgrey ctermbg=none

" Toggle terminal using F2
nnoremap <F2> :call ToggleTerminal()<CR>

function! ToggleTerminal()
    if &buftype ==# 'terminal'
        quit
    else
        :botright terminal
    endif
endfunction

" Resize window using Ctrl + hjkl, through it is not good enough
nnoremap <silent> <C-h> :call ResizeWindow('h')<CR>
nnoremap <silent> <C-j> :call ResizeWindow('j')<CR>
nnoremap <silent> <C-k> :call ResizeWindow('k')<CR>
nnoremap <silent> <C-l> :call ResizeWindow('l')<CR>

function! ResizeWindow(direction)
    let l:winwidth = winwidth(0)
    let l:winheight = winheight(0)
    if a:direction ==# 'h'
        execute 'vertical resize ' . (l:winwidth + 5) . ' +'
    elseif a:direction ==# 'j'
        execute 'resize ' . (l:winheight + 5) . ' +'
    elseif a:direction ==# 'k'
        execute 'resize ' . (l:winheight - 5) . ' -'
    elseif a:direction ==# 'l'
        execute 'vertical resize ' . (l:winwidth - 5) . ' -'
    endif
endfunction

set guifont=Fira\Code\ 12

"----------------------------------------------------------------
" Plugins installtion
"----------------------------------------------------------------
call plug#begin('~/.vim_runtime/my_plugins')
    " Declare the list of plugins
    Plug 'voldikss/vim-floaterm'
call plug#end()

" Run :PlugInstall in vim to install & update the plugins

"----------------------------------------------------------------
" Configuration for plugins
"----------------------------------------------------------------
" Nerd Tree config
nnoremap <F6> :NERDTreeToggle<CR>
au VimEnter *  NERDTree                " Open Nerd Tree by default
let g:NERDTreeWinPos = "left"

" Float terminal config
let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_keymap_toggle = '<Leader>t'
