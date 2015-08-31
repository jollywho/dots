set completeopt-=preview
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
if !exists('g:ycm_filetype_specific_completion_to_disable')
    let g:ycm_filetype_specific_completion_to_disable = {}
endif
nnoremap <leader>h :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>e :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>

highlight YcmErrorSign ctermbg=NONE ctermfg=177 cterm=underline
highlight YcmWarningSign ctermbg=NONE ctermfg=177
let g:ycm_warning_symbol = '**'
let g:ycm_error_symbol = '**'
" TODO: obj.what.<tab> re-open comp if closed
