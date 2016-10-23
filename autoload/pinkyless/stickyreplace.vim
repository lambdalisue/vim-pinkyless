function! pinkyless#stickyreplace#enter(trigger) abort
  let char = nr2char(getchar())
  if char ==# a:trigger
    let keyboard = pinkyless#keyboard()
    let char = pinkyless#stickyshift#enter(a:trigger)
  endif
  let line = getline('.')
  let col = col('.')
  let lhs = col == 1 ? '' : line[:col-2]
  let rhs = col == 1 ? line[1:] : line[col:]
  call setline('.', lhs . char . rhs)
endfunction
