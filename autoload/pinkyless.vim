function! pinkyless#keyboard(...) abort
  let name = a:0 > 0 ? a:1 : g:pinkyless#keyboard
  " Use cached keyboard to reduce function calls
  if exists('s:keyboard_' . name)
    return s:keyboard_{name}
  endif
  try
    let s:keyboard_{name} = pinkyless#keyboard#{name}#define()
  catch /^Vim\%((\a\+)\)\=:E117/
    " The keyboard does not exist, fallback to US keyboard
    let s:keyboard_{name} = pinkyless#keyboard#US#define()
  endtry
  return s:keyboard_{name}
endfunction

function! pinkyless#shift(char) abort
  let keyboard = pinkyless#keyboard(g:pinkyless#keyboard)
  return keyboard.shift(a:char)
endfunction

function! pinkyless#unshift(char) abort
  let keyboard = pinkyless#keyboard(g:pinkyless#keyboard)
  return keyboard.unshift(a:char)
endfunction



call pinkyless#util#define('pinkyless', {
      \ 'keyboard': 'US',
      \})
