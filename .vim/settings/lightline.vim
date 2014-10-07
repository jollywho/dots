let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
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
