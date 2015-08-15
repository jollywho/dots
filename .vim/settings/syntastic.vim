"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

function Inc_remove()
  let g:syntastic_c_remove_include_errors = 1
endfunction
command! IncludeCheckOff call Inc_remove()
