let s:keyboard = {}
let s:keyboard.symbol_map = {
      \ ';': ':',
      \ '1': '!', '2': '@', '3': '#', '4': '$', '5': '%',
      \ '6': '^', '7': '&', '8': '*', '9': '(', '0': ')',
      \ ',': '<', '.': '>', '/': '?', '-': '_', '=': '+',
      \ '[': '{', ']': '}', '`': '~', "'": "\"", '\': '|',
      \}
let s:keyboard.symbol_map_r = pinkyless#util#swap(s:keyboard.symbol_map)

function! s:keyboard.shift(char) abort
  if a:char =~# '\l'
    return toupper(a:char)
  elseif has_key(self.symbol_map, a:char)
    return self.symbol_map[a:char]
  else
    return a:char
  endif
endfunction

function! s:keyboard.unshift(char) abort
  if a:char =~# '\L'
    return tolower(a:char)
  elseif has_key(self.symbol_map_r, a:char)
    return self.symbol_map_r[a:char]
  else
    return a:char
  endif
endfunction

function! s:keyboard.swap(char) abort
  let keys = self.keys()
  return index(keys, a:char) == -1
        \ ? self.unshift(a:char)
        \ : self.shift(a:char)
endfunction

function! s:keyboard.keys() abort
  let keys = split('abcdefghijklmnopqrstuvwxyz', '\zs')
  return extend(keys, keys(self.symbol_map))
endfunction

function! s:keyboard.shift_keys() abort
  let keys = split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
  return extend(keys, values(self.symbol_map))
endfunction


function! pinkyless#keyboard#US#define() abort
  return s:keyboard
endfunction
