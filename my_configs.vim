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
" Configuration for plugins
"----------------------------------------------------------------
" Nerd Tree config
let g:NERDTreeWinPos = "left"
nnoremap <F6> :NERDTreeToggle<CR>
