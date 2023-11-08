if exists('g:loaded_smartcasematch_plugin') && g:loaded_smartcasematch_plugin
 finish
endif

if !exists('g:smartcasematch_separator_pattern')
 let g:smartcasematch_separator_pattern = '[_-]\?'
endif

if !exists('g:smartcasematch_keyword_pattern')
 let g:smartcasematch_keyword_pattern = '[A-Za-z0-9_-]'
endif

function! smartcasematch#Match(keyword)
  let keyword = a:keyword
  if empty(keyword) | return | endif
  let regexp = '\l\+\|\u\l\+\|\u\+\l\@!\|\d\+'
  let matchPattern = ''
  let i = 0
  let s = 0
  while i < strlen(keyword)
    let s = match(keyword, regexp, i)
    if s >= 0
      let i = matchend(keyword, regexp, s)
      let word = tolower(strpart(keyword, s, i - s))
      if empty(matchPattern)
        let matchPattern = word
      else
        let matchPattern = matchPattern . g:smartcasematch_separator_pattern . word
      endif
    else
      break
    endif
  endwhile
  let @/ = matchPattern
endfunction

function! smartcasematch#CursorKeyword()
  let line = getline('.')
  let col = col('.') - 1
  let start = col
  while start > 0 && line[start - 1] =~# g:smartcasematch_keyword_pattern
    let start -= 1
  endwhile
  let end = col
  while end < len(line) && line[end] =~# g:smartcasematch_keyword_pattern
    let end += 1
  endwhile
  return line[start : end - 1]
endfunction

function! smartcasematch#VisualSelected() range
    let s = @a
    silent! normal! gv"ay
    let r = @a
    let @a = s
    let s = match(r, '\v^' . g:smartcasematch_keyword_pattern . '+$')
    if s < 0 | return '' | return r | endif
    return r
endfunction

command! SmartCaseMatchCursorKeyword call smartcasematch#Match(smartcasematch#CursorKeyword())
command! SmartCaseMatchVisualSelected call smartcasematch#Match(smartcasematch#VisualSelected())
command! -nargs=1 SmartCaseMatch call smartcasematch#Match(<q-args>)

let g:loaded_smartcasematch_plugin = 1
