set noshowmode
set noruler

" Get current filetype
function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

function! AleStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
  \ '%dW %dE',
  \ all_non_errors,
  \ all_errors
  \)
endfunction

function! GitGutterStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

" set colors for statusline based on mode
function! DetectMode(mode)
  if 0
    let left=""
    let right=""
  else
    let left=""
    let right=""
  end

  let statusline=""
  if a:mode == 'n'
    let statusline .= "%#ModeNFGCS#\ " . left
    let statusline .= "%#ModeNFGC#\ NORMAL\ "
    let statusline .= "%#ModeNFGCS#" . right . "\ " . left
    let statusline .= "%#ModeNFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode == 'i'
    let statusline .= "%#ModeIFGCS#\ " . left
    let statusline .= "%#ModeIFGC#\ INSERT\ "
    let statusline .= "%#ModeIFGCS#" . right . "\ " . left
    let statusline .= "%#ModeIFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode == 'R'
    let statusline .= "%#ModeRFGCS#\ " . left
    let statusline .= "%#ModeRFGC#\ REPLACE\ "
    let statusline .= "%#ModeRFGCS#" . right . "\ " . left
    let statusline .= "%#ModeRFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# 'v'
    let statusline .= "%#ModeVFGCS#\ " . left
    let statusline .= "%#ModeVFGC#\ VISUAL\ "
    let statusline .= "%#ModeVFGCS#" . right . "\ " . left
    let statusline .= "%#ModeVFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# 'V'
    let statusline .= "%#ModeVFGCS#\ " . left
    let statusline .= "%#ModeVFGC#\ VISUAL\ "
    let statusline .= "%#ModeVFGCS#" . right . "\ " . left
    let statusline .= "%#ModeVFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# ''
    let statusline .= "%#ModeVFGCS#\ " . left
    let statusline .= "%#ModeVFGC#\ VISUAL\ "
    let statusline .= "%#ModeVFGCS#" . right . "\ " . left
    let statusline .= "%#ModeVFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# 'c'
    let statusline=""
    let statusline .= "%#ModeCFGCS#\ " . left
    let statusline .= "%#ModeCFGC#\ COMMAND\ "
    let statusline .= "%#ModeCFGCS#" . right . "\ " . left
    let statusline .= "%#ModeCFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# 't'
    let statusline .= "%#ModeTFGCS#\ " . left
    let statusline .= "%#ModeTFGC#\ TERMINAL\ "
    let statusline .= "%#ModeTFGCS#" . right . "\ " . left
    let statusline .= "%#ModeTFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V' || a:mode == 's' || a:mode == 'S' || a:mode == '^S'
    let statusline .= "%#ModeVFGCS#\ " . left
    let statusline .= "%#ModeVFGC#\ VISUAL\ "
    let statusline .= "%#ModeVFGCS#" . right . "\ " . left
    let statusline .= "%#ModeVFGC#%[%n\ ̷%{bufnr('$')}\ "
  endif
  if &mod == 1
	let statusline .= "%#Modified#\ %.20f\ ⁺%#ModifiedS#" . right . "\ "
  else
	let statusline .= "%#Buffer#\ %.20f\ %#BufferS#" . right . "\ "
  endif
  let statusline .= "%="
  " if exists('*fugitive#statusline')
    " let statusline .= "%#BufferS#" . left . "%#SLGreen#\ %{FugitiveHead()}"
  " else
    " let statusline .= "%#BufferS#" . left
  " endif
  " let statusline .= "%#SLBlue#\ %{GitGutterStatus()}\ %#BufferS#" . right . "\ "
  let statusline .= "%#BufferS#" . left . "%#Buffer#\ %{CheckFT(&filetype)}\ %#BufferS#" . right
  " if AleStatus() == "OK"
    " let statusline .= "%#SLLimiter#│%#CursorStatus#\ %{AleStatus()}\ %#BufferS#" . right . "\ "
  " else
    " let statusline .= "\ %#BufferError#\ %{AleStatus()}\ %#BufferErrorS#" . right . "\ "
  " endif
  let statusline .= "%#BufferS#" . left . "%#CursorStatus#\ %-8.(%l,%c%)%#ModeNFGC#\ %P\ %#ModeNFGCS#" . right . "\ "
  return statusline
  return ' '
endfunction

set laststatus=2
set statusline=%!DetectMode(mode())

" vim:set ft=vim et sw=2:
