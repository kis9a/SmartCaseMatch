if exists('g:loaded_smartcasematch_plugin') && g:loaded_smartcasematch_plugin
  finish
endif

if !exists('g:smartcasematch_separator_pattern')
  let g:smartcasematch_separator_pattern = '[_-]\?'
endif

if !exists('g:smartcasematch_string_pattern')
  let g:smartcasematch_string_pattern = '[A-Za-z0-9_-]'
endif

if !exists('g:smartcasematch_split_pattern')
  let g:smartcasematch_split_pattern = '\l\+\|\u\l\+\|\u\+\l\@!\|\d\+'
endif

if !exists('g:smartcasematch_last_mached_pattern')
  let g:smartcasematch_last_mached_pattern = ''
endif

function! SmartCaseMatch(string)
  let @/ = SmartCaseMatchPattern(a:string)
endfunction

function! SmartCaseMatchPattern(string)
  let string = a:string
  if empty(string) | return | endif
  let matchPattern = ''
  let i = 0
  let s = 0
  while i < strlen(string)
    let s = match(string, g:smartcasematch_split_pattern, i)
    if s >= 0
      let i = matchend(string, g:smartcasematch_split_pattern, s)
      let word = tolower(strpart(string, s, i - s))
      if empty(matchPattern)
        let matchPattern = word
      else
        let matchPattern = matchPattern . g:smartcasematch_separator_pattern . word
      endif
    else
      break
    endif
  endwhile
  let g:smartcasematch_last_mached_pattern = matchPattern
  return g:smartcasematch_last_mached_pattern
endfunction

function! smartcasematch#CursorString()
  let line = getline('.')
  let col = col('.') - 1
  let start = col
  while start > 0 && line[start - 1] =~# g:smartcasematch_string_pattern
    let start -= 1
  endwhile
  let end = col
  while end < len(line) && line[end] =~# g:smartcasematch_string_pattern
    let end += 1
  endwhile
  return line[start : end - 1]
endfunction

function! smartcasematch#VisualSelected() range
  let s = @a
  silent! normal! gv"ay
  let r = @a
  let @a = s
  let s = match(r, '\v^' . g:smartcasematch_string_pattern . '+$')
  if s < 0 | return '' | return r | endif
  return r
endfunction

command! -nargs=1 SmartCaseMatch call SmartCaseMatch(<q-args>)
command! -nargs=1 SmartCaseMatchPattern call SmartCaseMatchPattern(<q-args>)
command! SmartCaseMatchCursorString call SmartCaseMatch(smartcasematch#CursorString())
command! SmartCaseMatchVisualSelected call SmartCaseMatch(smartcasematch#VisualSelected())

let g:loaded_smartcasematch_plugin = 1
