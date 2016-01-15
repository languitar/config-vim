scriptencoding utf-8

" bundle settings
set nocompatible
filetype off

set runtimepath+=~/.local/share/nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.local/share/nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" general configuration
NeoBundle 'sjl/badwolf'
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'bling/vim-airline'
" NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'kopischke/unite-spell-suggest', { 'on_unite': 'spell_suggest' }
NeoBundle 'gcmt/taboo.vim'
NeoBundle 'bkad/CamelCaseMotion'

" completion
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'benekastah/neomake'

" SCM support
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" editing aids
NeoBundle 'ciaranm/detectindent'
NeoBundle 'bronson/vim-trailing-whitespace'
" NeoBundle 'terryma/vim-multiple-cursors'
" NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'kshenoy/vim-signature'
" NeoBundle 'terryma/vim-expand-region'

" language support
" NeoBundle 'jalcine/cmake.vim'
NeoBundle 'vim-latex/vim-latex'
NeoBundle 'Rykka/riv.vim'
" NeoBundle 'Rykka/InstantRst'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'nelstrom/vim-markdown-folding'
NeoBundle 'elzr/vim-json'
NeoBundle 'dag/vim-fish'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'bps/vim-textobj-python'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'chrisbra/csv.vim'
" NeoBundle 'jceb/vim-orgmode'
NeoBundle 'vim-scripts/icalendar.vim'
" NeoBundle 'plasticboy/vim-markdown'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" define a default autocmd group to prevent duplicated commands
augroup vimrc
    " Remove everything that existed in this group to prevent duplicated calls
    autocmd!
augroup END

" general settings independent of plugins
set shell=bash " fix the shell to something vim understand

syntax on " enable syntax highlighting
set number " show line numbers

set encoding=utf8 " default encoding
set fileformats=unix,dos,mac " set newline preferences

" default indentation settings
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent

" detect lists when wrapping lines
set formatoptions+=n
let &formatlistpat='^\s*\(\d\+[\]:.)}\t ]\|[*-][\t ]\)\s*'

" scrolling
set scrolloff=3

" spell checking
set spell spelllang=en,de

" search options
set hlsearch " highlight search matches. Turn of with :nohlsearch after a search
set incsearch " highlight partial search pattern matches while typing
set ignorecase " usually ignore case when searching
set smartcase " unless a search term starts with a capital letter

" print margin at the specified textwidth setting (- important to distinguish
" from off (being 0))
set colorcolumn=-0

" show leader character
set showcmd

" virtual line breaks on word boundaries with correct indentation
set linebreak
if exists("&breakindent")
    set breakindent
endif

" allow project-specific settings
set exrc
set secure

" let backspace do something reasonable, i.e. delete also things outside the
" current insert operation
set backspace=indent,eol,start

" ensure that ctrl+u in insert mode can be reversed
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" bracket matching settings
highlight MatchParen cterm=bold ctermbg=none ctermfg=9

" tab completion mode with partial match and list
set wildmode=list:longest,full
set wildmenu

" allow mouse control
set mouse=a

" color scheme
" set background=dark
colorscheme badwolf
let g:airline_theme="badwolf"
" local color scheme modifications
" highlight ColorColumn ctermbg=8
highlight DiffAdd ctermbg=2
highlight DiffDelete ctermbg=1
highlight DiffChange ctermbg=238
highlight DiffChange ctermbg=242

" status line modification
set laststatus=2 " always show a status line
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#syntastic#enabled=0 " already visible in gutter
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts=1

" detect indent settings
let g:detectindent_preferred_expandtab=1
let g:detectindent_preferred_indent=4
" autocmd BufReadPost * :DetectIndent

" nerdtree modifications
" let NERDTreeShowHidden=1
" change cwd with nerd tree
let NERDTreeChDirMode=2
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.egg-info$', '\.egg$']
" autopen NERDTree and focus cursor in new document
" autocmd vimrc VimEnter * NERDTree
" autocmd vimrc VimEnter * wincmd p
" open nerdtree if no documents will be opened
" autocmd vimrc StdinReadPre * let s:std_in=1
" autocmd vimrc VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" syntastic config
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['pep8', 'pylint']
let g:syntastic_aggregate_errors=1

" Neomake settings
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }
hi MyWarningMsg ctermbg=3 ctermfg=0
let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'MyWarningMsg',
            \ }

let g:neomake_c_enabled_makers = []
let g:neomake_cpp_enabled_makers = []
let g:neomake_tex_enabled_makers = [ 'chktex' ]
" let g:neomake_python_enabled_makers = [ 'pylama', 'pylint' ]
autocmd vimrc BufReadPost,BufWritePost * Neomake

" YouCompleteMe settings
nnoremap <leader>gt :YcmCompleter GoTo<CR>
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_add_preview_to_completeopt=1

" ctrlp settings
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp' " cache path results
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|.*\.egg-info$',
  \ 'file': '\v\.(so|o|pyc)$'
  \ }
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --exclude-standard'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'ag %s -l --nocolor --hidden -g ""',
  \ 'ignore': 1
  \ }

" unite settings
" ctrlp-like behavior from https://gist.github.com/copitux/6434354
nnoremap <C-p> :Unite -start-insert file_rec/async<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
  \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

let g:unite_prompt = '>>> '
let g:unite_winheight = 15
let g:unite_update_time = 200
let g:unite_split_rule = 'botright'
let g:unite_data_directory = $HOME.'/.vim/tmp/unite'

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " Overwrite settings.
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction
nmap z= :Unite spell_suggest <CR>

" markdown settings
let g:vim_markdown_initial_foldlevel=1
let g:instant_markdown_slow=1
let g:instant_markdown_autostart=0

" taboo settings
let g:taboo_tabline = 0

" JSON highlighting settings
let g:vim_json_syntax_conceal=0 " do not remove double quotes in view

" InstantRst settings
" let g:instant_rst_browser='chromium-browser'
let g:instant_rst_bind_scroll=0

" latex settings
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_IgnoredWarnings=''

" vim-slime
let g:slime_target="tmux"
let g:slime_python_ipython=1
let g:slime_no_mappings=1
nmap <c-c><c-f> vaf :SlimeSend<CR>
nmap <c-c><c-c> vac :SlimeSend<CR>
nmap <c-c><c-l> V :SlimeSend<CR>
nmap <c-c><c-p> vip :SlimeSend<CR>
xmap <c-c><c-c> :SlimeSend<CR>

" python folding
let g:SimpylFold_docstring_preview=1

" riv rest settings
" let g:riv_disable_folding=1

" fix editing modes to file types
autocmd vimrc BufRead,BufNewFile rsb.conf set filetype=dosini
autocmd vimrc BufRead,BufNewFile *.project set filetype=json
autocmd vimrc BufRead,BufNewFile *.template set filetype=json
autocmd vimrc BufRead,BufNewFile *.distribution set filetype=json
autocmd vimrc BufRead,BufNewFile *.ics set filetype=icalendar
autocmd vimrc BufNewFile,BufReadPost *.md set filetype=markdown
autocmd vimrc BufNewFile,BufReadPost *.md.erb set filetype=markdown

" key bindings to open navigation aids
nmap <leader>nt :NERDTreeToggle <CR>
map <leader>tb :TagbarToggle <CR>
map <leader>b :Unite buffer <CR>

" settings for neovim terminals
if v:progname == "nvim"
    autocmd vimrc TermOpen * setlocal nospell
    command Fish :terminal fish
    let g:terminal_scrollback_buffer_size=100000
endif

" mappings for using tabs
" map <F5> :tabe<CR>
" map <F6> :tabc<CR>
" map <F7> :tabp<CR>
" map <F8> :tabn<CR>

" mappings for navigating between windows with alt+arrows
nmap <silent> <C-L> :wincmd l<CR>
nmap <silent> <C-H> :wincmd h<CR>
nmap <silent> <C-K> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>

" Handle tmux $TERM quirks in vim
map <Esc>OH <Home>
map! <Esc>OH <Home>
map <Esc>OF <End>
map! <Esc>OF <End>

" leader combination to stop search highlighting
map <leader>h :nohlsearch <CR>

" function to explain the different highlights for spelling errors
function! s:SpellLegend()
    for [l:group, l:explanation] in [
    \   ['SpellBad', 'word not recognized'],
    \   ['SpellCap', 'word not capitalized'],
    \   ['SpellRare', 'rare word'],
    \   ['SpellLocal', 'wrong spelling for selected region']
    \]
        echo ''
        echon l:group . "\t"
        execute 'echohl' l:group
        echon 'xxx'
        echohl None
        echon "\t" . l:explanation
    endfor
endfunction
command! -bar SpellLegend call s:SpellLegend()

" utility commands
command Wsudo w !sudo tee % > /dev/null