let g:lightline = {
      \ 'colorscheme': 'sceaduhelm',
      \ 'active': {
      \ 'left': [ [ 'mode' ],
      \ [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \ 'readonly': '%{&readonly?"⭤":""}',
      \ 'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \ 'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }
let g:lightline.mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'V-L',
      \ 'c' : 'C',
      \ "\<C-v>": 'V-B',
      \ 's' : 'S',
      \ 'S' : 'S-L',
      \ "\<C-s>": 'S-B',
      \ '?': '      ' }
