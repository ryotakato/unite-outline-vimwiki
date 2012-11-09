"=============================================================================
" File    : autoload/unite/sources/outline/vimwiki.vim
" Author  : ryotakato <ryotakato4@gmail.com>
" Updated : 2012-11-10
"
" Licensed under the MIT license:
" http://www.opensource.org/licenses/mit-license.php
"
"=============================================================================


" outline info for Vimwiki
" Version: 0.1.0

function! unite#sources#outline#vimwiki#outline_info()
  return s:outline_info
endfunction

"-----------------------------------------------------------------------------
" Outline Info

let s:outline_info = {}

function! s:outline_info.initialize()

  let vimwiki_rxH = get(g:, 'vimwiki_rxH', '=')

  let heading_rx = []
  for i in range(1,6)
    call add(heading_rx, '^\s*'.vimwiki_rxH.'\{'.i.'}[^'.vimwiki_rxH.'].*[^'.vimwiki_rxH.']'.vimwiki_rxH.'\{'.i.'}\s*$')
  endfor

  let self.heading = join(heading_rx, '\|')
endfunction

function! s:outline_info.create_heading(which, heading_line, matched_line, context)
  let heading = {
        \ 'word' : substitute(a:heading_line, '^\s*=\+\|=\+\s*$', '', 'g'),
        \ 'level': strlen(matchstr(a:heading_line, '^\s*\zs=\+\ze')),
        \ 'type' : 'generic',
        \ }
  return heading
endfunction

