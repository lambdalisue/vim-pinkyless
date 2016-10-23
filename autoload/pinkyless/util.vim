function! pinkyless#util#swap(d) abort
  let ks = keys(a:d)
  let vs = values(a:d)
  let swap = {}
  for i in range(len(ks))
    let swap[vs[i]] = ks[i]
  endfor
  return swap
endfunction

function! pinkyless#util#define(prefix, default) abort
  let prefix = a:prefix =~# '^g:' ? a:prefix : 'g:' . a:prefix
  for [key, Value] in items(a:default)
    let name = prefix . '#' . key
    if !exists(name)
      execute 'let ' . name . ' = ' . string(Value)
    endif
    unlet Value
  endfor
endfunction
