"=============================================================================
" FILE: neoyank.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
"=============================================================================

if exists('g:loaded_neoyank')
  finish
endif

augroup neoyank
  autocmd!
augroup END

if exists('##TextYankPost')
  autocmd neoyank TextYankPost,FocusGained,FocusLost *
        \ silent call neoyank#_append()
else
  autocmd neoyank WinEnter,BufWinEnter,CursorMoved,BufWritePost,
        \CursorHold,FocusGained,FocusLost,VimLeavePre *
        \ silent call neoyank#_append()
  if v:version > 703 || v:version == 703 && has('patch867')
    autocmd neoyank TextChanged *
          \ silent call neoyank#_append()
  endif
endif

let g:loaded_neoyank = 1
