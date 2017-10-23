" custom vimtex insert mode mappings
call vimtex#imaps#add_map({
    \ 'lhs' : '<m-i>',
    \ 'rhs' : '',
    \ 'leader'  : '',
    \ 'wrapper' : 'vimtex#imaps#wrap_environment',
    \ 'context' : [
    \   {'envs' : ['itemize', 'enumerate'],
    \    'rhs' : '\item '},
    \   {'envs' : ['description'],
    \    'rhs' : '\item['},
    \ ],
    \})
