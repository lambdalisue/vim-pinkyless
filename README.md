pinkyless.vim
==============================================================================

Even Vimmer use them pinkies a lot. Rest your pinkies by using this plugin :-)


Concepts
------------------------------------------------------------------------------

1. It would be nice if Sticky shift could be used in Vim to reduce the opportunities of hitting `Shift`
2. It would be nice if the sticky shift above are also available in a single character replacement mode (`r`)
3. It would be nice if there is a software Capslock while Capslock in normal mode breaks everything.


Usage
------------------------------------------------------------------------------

- Hit `;` to start sticky shift mode in Insert/Command/Select mode.
  In sticky shift mode, hit `<Space>` to type a trigger key (in this case, `;`)
- Hit `r` to start sticky replace mode in Normal mode.
  In sticky replace mode, hit `;` to start the sticky shift mode.
- Hit `<F10>` to start Capslock mode in Insert/Command/Select mode.
  In Capslock mode, hit `<F10>` again to leave or `<Esc>` to enter Normal mode.

The behaviours are customizable but not documented yet.


Reference
------------------------------------------------------------------------------

The initial concept comes from http://vim-jp.org/vim-users-jp/2009/08/09/Hack-54.html (in Japanese)
