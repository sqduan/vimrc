"================================================================
" Personal used VIM configure file
"
" This is a VIM configuration file for my personal use which is
" based on the everforest color scheme. It includes settings for
" basic VIM feature and plug-ins, hope you like this.
"
" @author: Shiqi Duan
" @date:   2024-2-3
"================================================================

"----------------------------------------------------------------
" Appearance setting for MyVim
"----------------------------------------------------------------
" Set color scheme as everforest
colorscheme everforest
set background=dark
let g:everforest_background = 'light'

" Remove the toolbar for gvim
:set guioptions -=m

" Set a column in 80 character
:set colorcolumn=80

" Set line number
:set nu

" Open as maximum window as default
set lines=9999
set columns=9999

" Set the cursor type
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Give a highlight to
highlight VertSplit cterm=bold ctermfg=darkgrey ctermbg=none
highlight StatusLine cterm=bold ctermfg=darkgrey ctermbg=none

" Set font for gvim, use Fira Code which is a programming friendly font
set guifont=Fira\Code\ 12

"----------------------------------------------------------------
" Default behavior settings
"----------------------------------------------------------------
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Let backspace behave normally
:set backspace=indent,eol,start

" Define the Leader key
:let mapleader = "\<tab>"

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

" Tab control
nnoremap <Leader>c :tabnew<CR>           " Create new tab
nnoremap <Leader>q :tabclose<CR>         " Close current tab
nnoremap <Leader>n :tabnext<CR>          " Go to next tab
nnoremap <Leader>p :tabprevious<CR>      " Go to previous tab

"----------------------------------------------------------------
" Plugins installation
"----------------------------------------------------------------
call plug#begin('~/.vim_runtime/my_plugins')
    " Declare the list of plugins
    Plug 'voldikss/vim-floaterm'
    Plug 'godlygeek/tabular'

    " Text & spell check
    Plug 'kamykn/spelunker.vim'

    " Add markdown support
    Plug 'preservim/vim-markdown'
    Plug 'iamcco/mathjax-support-for-mkdp'
    Plug 'iamcco/markdown-preview.vim'
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
nnoremap   <silent>   <F2>   :FloatermToggle<CR>
tnoremap   <silent>   <F2>   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <F3>    :FloatermPrev<CR>
tnoremap   <silent>   <F3>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F4>    :FloatermNext<CR>
tnoremap   <silent>   <F4>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>    :FloatermNew<CR>
tnoremap   <silent>   <F12>    <C-\><C-n>:FloatermNew<CR>

" For Markdown config
nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview
