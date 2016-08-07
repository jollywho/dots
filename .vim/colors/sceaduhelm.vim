" lightline color scheme
"
" Name:   lightline-sceaduhelm.vim
" Author: Takaaki Hirano <hivedark@gmail.com>
" Source: https://github.com/wolf-dog/lightline-sceaduhelm.vim

let s:black          = [ '#121212', 233 ]
let s:dark_gray      = [ '#1c1c1c', 234 ]
let s:gray           = [ '#262626', 235 ]
let s:light_gray     = [ '#666666', 242 ]
let s:white          = [ '#dadada', 253 ]
let s:sand           = [ '#87875f', 101 ]
let s:blue_gray      = [ '#5f87af', 67  ]
let s:asparagus      = [ '#87af5f', 107 ]
let s:corn           = [ '#ffdf5f', 221 ]
let s:tangelo        = [ '#ff5f00', 202 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:black, s:sand], [s:white, s:gray ] ]
let s:p.normal.middle   = [ [ s:white, s:dark_gray ] ]
let s:p.normal.right    = [ [ s:black, s:sand], [s:white, s:gray ] ]
let s:p.normal.error    = [ [ s:black, s:tangelo ] ]
let s:p.normal.warning  = [ [ s:black, s:tangelo ] ]
let s:p.inactive.left   = [ [ s:light_gray, s:gray], [s:light_gray, s:gray ] ]
let s:p.inactive.middle = [ [ s:light_gray, s:dark_gray ] ]
let s:p.inactive.right  = [ [ s:light_gray, s:gray], [s:light_gray, s:gray ] ]
let s:p.insert.left     = [ [ s:black, s:blue_gray], [s:blue_gray, s:gray ] ]
let s:p.insert.middle   = [ [ s:blue_gray, s:dark_gray ] ]
let s:p.insert.right    = [ [ s:black, s:blue_gray], [s:blue_gray, s:gray ] ]
let s:p.replace.left    = [ [ s:black, s:asparagus], [s:asparagus, s:gray ] ]
let s:p.replace.middle  = [ [ s:asparagus, s:dark_gray ] ]
let s:p.replace.right   = [ [ s:black, s:asparagus], [s:asparagus, s:gray ] ]
let s:p.visual.left     = [ [ s:black, s:corn], [s:corn, s:gray ] ]
let s:p.visual.middle   = [ [ s:corn, s:dark_gray ] ]
let s:p.visual.right    = [ [ s:black, s:corn], [s:corn, s:gray ] ]
let s:p.tabline.left    = [ [ s:white, s:gray ] ]
let s:p.tabline.tabsel  = [ [ s:black, s:sand ] ]
let s:p.tabline.middle  = [ [ s:white, s:gray ] ]
let s:p.tabline.right   = [ [ s:white, s:dark_gray ] ]

let g:lightline#colorscheme#sceaduhelm#palette = lightline#colorscheme#flatten(s:p)

