" Ref: http://vim-jp.org/vim-users-jp/2009/08/09/Hack-54.html
function! pinkyless#stickyshift#enter(trigger) abort
  doautocmd <nomodeline> User PinkylessStickyShiftEnter
  let char = nr2char(getchar())
  doautocmd <nomodeline> User PinkylessStickyShiftLeave
  if has_key(g:pinkyless#stickyshift#substitutions, char)
    let char = g:pinkyless#stickyshift#substitutions[char]
    return substitute(char, '<Trigger>', a:trigger, 'g')
  endif
  let keyboard = pinkyless#keyboard()
  return keyboard.swap(char)
endfunction

" To prevent 'No such autocmd'
augroup pinkyless_stickyshift_dummy
  autocmd! *
  autocmd User PinkylessStickyShiftEnter :
  autocmd User PinkylessStickyShiftLeave :
augroup END

call pinkyless#util#define('pinkyless#stickyshift', {
      \ 'substitutions': {
      \   "\<Space>": "<Trigger>",
      \   "\<CR>": "<Trigger>\<CR>",
      \ },
      \})
