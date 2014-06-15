" Make it beautiful - colors and fonts

colorscheme desert
set background=dark

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h18
  else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h18
  end
else
  "dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
endif

hi CursorLine cterm=NONE ctermbg=8
set cursorline
hi CursorColumn cterm=NONE ctermbg=8
set cursorcolumn
