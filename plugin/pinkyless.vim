if exists('g:loaded_pinkeyless')
  finish
endif
let g:loaded_pinkyless = 1

" Default configurations
let g:pinkyless_capslock_trigger =
      \ get(g:, 'pinkyless_capslock_trigger', '<F10>')

let g:pinkyless_stickyshift_trigger =
      \ get(g:, 'pinkyless_stickyshift_trigger', ';')

let g:pinkyless_stickyreplace_trigger =
      \ get(g:, 'pinkyless_stickyreplace_trigger', 'r')

let g:pinkyless_capslock_i = get(g:, 'pinkyless_capslock_i', 1)
let g:pinkyless_capslock_c = get(g:, 'pinkyless_capslock_c', 1)
let g:pinkyless_capslock_s = get(g:, 'pinkyless_capslock_s', 1)

let g:pinkyless_stickyshift_i = get(g:, 'pinkyless_stickyshift_i', 1)
let g:pinkyless_stickyshift_c = get(g:, 'pinkyless_stickyshift_c', 1)
let g:pinkyless_stickyshift_s = get(g:, 'pinkyless_stickyshift_s', 1)

let g:pinkyless_stickyreplace_n = get(g:, 'pinkyless_stickyreplace_n', 1)


" Capslock <Plug> mappings
inoremap <expr> <Plug>(pinkyless-capslock-enter)
      \ pinkyless#capslock#enter('i')
inoremap <expr> <Plug>(pinkyless-capslock-leave)
      \ pinkyless#capslock#leave('i')
inoremap <expr> <Plug>(pinkyless-capslock-toggle)
      \ pinkyless#capslock#toggle('i')
cnoremap <expr> <Plug>(pinkyless-capslock-enter)
      \ pinkyless#capslock#enter('c')
cnoremap <expr> <Plug>(pinkyless-capslock-leave)
      \ pinkyless#capslock#leave('c')
cnoremap <expr> <Plug>(pinkyless-capslock-toggle)
      \ pinkyless#capslock#toggle('c')
snoremap <expr> <Plug>(pinkyless-capslock-enter)
      \ pinkyless#capslock#enter('s')
snoremap <expr> <Plug>(pinkyless-capslock-leave)
      \ pinkyless#capslock#leave('s')
snoremap <expr> <Plug>(pinkyless-capslock-toggle)
      \ pinkyless#capslock#toggle('s')

" Sticky shift <Plug> mappings
inoremap <expr> <Plug>(pinkyless-stickyshift-enter)
      \ pinkyless#stickyshift#enter(g:pinkyless_stickyshift_trigger)
cnoremap <expr> <Plug>(pinkyless-stickyshift-enter)
      \ pinkyless#stickyshift#enter(g:pinkyless_stickyshift_trigger)
snoremap <expr> <Plug>(pinkyless-stickyshift-enter)
      \ pinkyless#stickyshift#enter(g:pinkyless_stickyshift_trigger)

" Sticky replace <Plug> mapping
nnoremap <silent> <Plug>(pinkyless-stickyreplace-enter)
      \ :<C-u>call pinkyless#stickyreplace#enter(g:pinkyless_stickyshift_trigger)<CR>


if get(g:, 'pinkyless_default_keymap', 1)
  " Capslock
  if g:pinkyless_capslock_i
    execute printf(
          \ 'imap %s <Plug>(pinkyless-capslock-toggle)',
          \ g:pinkyless_capslock_trigger,
          \)
  endif
  if g:pinkyless_capslock_c
    execute printf(
          \ 'cmap %s <Plug>(pinkyless-capslock-toggle)',
          \ g:pinkyless_capslock_trigger,
          \)
  endif
  if g:pinkyless_capslock_s
    execute printf(
          \ 'smap %s <Plug>(pinkyless-capslock-toggle)',
          \ g:pinkyless_capslock_trigger,
          \)
  endif

  " Sticky shit
  if g:pinkyless_stickyshift_i
    execute printf(
          \ 'imap %s <Plug>(pinkyless-stickyshift-enter)',
          \ g:pinkyless_stickyshift_trigger,
          \)
  endif
  if g:pinkyless_stickyshift_c
    execute printf(
          \ 'cmap %s <Plug>(pinkyless-stickyshift-enter)',
          \ g:pinkyless_stickyshift_trigger,
          \)
  endif
  if g:pinkyless_stickyshift_s
    execute printf(
          \ 'smap %s <Plug>(pinkyless-stickyshift-enter)',
          \ g:pinkyless_stickyshift_trigger,
          \)
  endif

  " Sticky replace
  if g:pinkyless_stickyreplace_n
    execute printf(
          \ 'nmap %s <Plug>(pinkyless-stickyreplace-enter)',
          \ g:pinkyless_stickyreplace_trigger,
          \)
  endif
endif
