function! pinkyless#capslock#enter(mode) abort
  doautocmd <nomodeline> User PinkylessCapslockEnter
  let b:pinkyless_capslock = 1
  let keyboard = pinkyless#keyboard()
  let keys = keyboard.keys()
  for key in keys
    let shift = keyboard.shift(key)
    execute printf(
          \ '%snoremap %s %s',
          \ a:mode,
          \ s:map_escape(key),
          \ s:map_escape(shift),
          \)
    execute printf(
          \ '%snoremap %s %s',
          \ a:mode,
          \ s:map_escape(shift),
          \ s:map_escape(key),
          \)
  endfor
  for key in keys(g:pinkyless#capslock#leave_keys)
    let passthrough = g:pinkyless#capslock#leave_keys[key]
    execute printf(
          \ '%smap <expr><nowait> %s pinkyless#capslock#leave(%s, %s)',
          \ a:mode,
          \ key,
          \ string(a:mode),
          \ passthrough ? string(key) : '',
          \)
  endfor
  return ''
endfunction

function! pinkyless#capslock#leave(mode, ...) abort
  let b:pinkyless_capslock = 0
  let keyboard = pinkyless#keyboard()
  let keys = keyboard.keys()
  for key in keys
    let shift = keyboard.shift(key)
    execute printf('%sunmap %s', a:mode, s:map_escape(key))
    execute printf('%sunmap %s', a:mode, s:map_escape(shift))
  endfor
  for key in keys(g:pinkyless#capslock#leave_keys)
    execute printf('%sunmap %s', a:mode, key)
  endfor
  doautocmd <nomodeline> User PinkylessCapslockLeave
  return get(a:000, 0, '')
endfunction

function! pinkyless#capslock#toggle(mode) abort
  if get(b:, 'pinkyless_capslock')
    return pinkyless#capslock#leave(a:mode)
  else
    return pinkyless#capslock#enter(a:mode)
  endif
endfunction


function! s:map_escape(key) abort
  if a:key ==# '|'
    return '<Bar>'
  elseif a:key ==# '\'
    return '\\'
  else
    return a:key
  endif
endfunction

" To prevent 'No such autocmd'
augroup pinkyless_capslock_dummy
  autocmd! *
  autocmd User PinkylessCapslockEnter :
  autocmd User PinkylessCapslockLeave :
augroup END

call pinkyless#util#define('pinkyless#capslock', {
      \ 'leave_keys': {
      \   "\<Esc>": 1,
      \ },
      \})
