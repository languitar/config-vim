scriptencoding utf8

" bundle settings
filetype off

call plug#begin('~/.local/share/nvim/bundle/')

" general configuration
Plug 'chriskempson/base16-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-clap', {'do': ':Clap install-binary'}
Plug 'gcmt/taboo.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/visualrepeat'
Plug 'wellle/targets.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'moll/vim-bbye'
Plug 'wellle/visual-split.vim'

" completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'chrisbra/unicode.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" SCM support
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tommcdo/vim-fubitive'
Plug 'rhysd/git-messenger.vim'
Plug 'christoomey/vim-conflicted'
Plug 'sodapopcan/vim-twiggy'
Plug 'rbong/vim-flog'
Plug 'mhinz/vim-signify'

" editing aids
Plug 'roryokane/detectindent', {'on': 'DetectIndent'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}
Plug 'tomtom/tcomment_vim'
Plug 'sk1418/Join', {'on': 'Join'}
Plug 'machakann/vim-highlightedyank'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}
Plug 'sbdchd/neoformat', {'on': 'Neoformat'}
Plug 'machakann/vim-sandwich'
Plug 'rhysd/vim-grammarous'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Konfekt/FastFold'
Plug 'wincent/ferret'
Plug 'tpope/vim-projectionist'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'KabbAmine/zeavim.vim'

" language support
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'Rykka/riv.vim', {'for': 'rst'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python', 'python3']}
Plug 'bps/vim-textobj-python', {'for': ['python', 'python3']}
Plug 'tmhedberg/SimpylFold', {'for': ['python', 'python3']}
Plug 'jamessan/vim-gnupg'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'vim-scripts/icalendar.vim', {'for': 'icalendar'}
Plug 'mxw/vim-jsx', {'for': 'jsx'}
Plug 'junegunn/vader.vim'
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
Plug 'OmniSharp/omnisharp-vim'
Plug 'gutenye/json5.vim'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'rasjani/robotframework-vim'

call plug#end()

set hidden
set noshowmode

" define a default autocmd group to prevent duplicated commands
augroup vimrc
    " Remove everything that existed in this group to prevent duplicated calls
    autocmd!
augroup END

" general settings independent of plugins
set shell=bash " fix the shell to something vim understand

set number " show line numbers
set relativenumber

set foldcolumn=1

set fileformats=unix,dos,mac " set newline preferences

" default indentation settings
set expandtab
set shiftwidth=4
set tabstop=4
set shiftround

" detect lists when wrapping lines
set formatoptions+=n
let &formatlistpat='^\s*\(\d\+[\]:.)}\t ]\|[*-][\t ]\)\s*'

" scrolling
set scrolloff=3

" spell checking
set spell spelllang=en,de

" search options
set ignorecase " usually ignore case when searching
set smartcase " unless a search term starts with a capital letter
set inccommand=nosplit

" print margin at the specified textwidth setting (- important to distinguish
" from off (being 0))
set colorcolumn=-0

" reload changed files
autocmd vimrc FocusGained * :checktime

" virtual line breaks on word boundaries with correct indentation
set linebreak
set breakindent

" remember tab names in sessions
set sessionoptions+=tabpages,globals,winpos,winsize,blank,resize

" allow project-specific settings
set exrc
set secure

" always show the sign colum to prevent flickering
set signcolumn=yes

" ensure that ctrl+u in insert mode can be reversed
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" tab completion mode with partial match and list
set wildmode=list:longest,full

" allow mouse control
set mouse=a

" avoid delays when exiting insert mode with escape
set ttimeoutlen=0

" more frequent updates and cursor hold
set updatetime=2000

" put leader to space
map <space> <leader>
map <space><space> <leader><leader>

" color scheme
set termguicolors

augroup vim-colors
    autocmd!
augroup END

autocmd vim-colors ColorScheme afterglow highlight ColorColumn guibg=#202020
autocmd vim-colors ColorScheme afterglow highlight FoldColumn guifg=#6c99bb

let g:afterglow_blackout=1
let g:afterglow_italic_comments=1
let g:airline_theme='onedark'
colorscheme afterglow

" solid utf-8 lines for splits
set fillchars=vert:\│

" recommended by vim-sandwich (and never used)
nmap s <Nop>
xmap s <Nop>
let g:sandwich#recipes=deepcopy(g:sandwich#default_recipes)

" indent guides
let g:indent_guides_default_mapping=0
let g:indent_guides_auto_colors=1

" Disable some polyglot packages
let g:polyglot_disabled = ['latex']

let g:airline_highlighting_cache=1

" status line modification
let g:airline#extensions#tabline#enabled=1
" already visible in gutter
let g:airline#extensions#syntastic#enabled=0
" I usually know where I am in a file
let g:airline#extensions#tagbar#enabled=0
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#displayed_head_limit=20
let g:airline#extensions#branch#format=2
let g:airline#extensions#branch#sha1_len=8
" reduce whitespace checks to what other plugins are not doing
let g:airline#extensions#whitespace#checks=['indent', 'mixed-indent-file']
let g:airline#extensions#taboo#enabled=1
let g:airline#extensions#ale#enabled=0
let g:airline#extensions#languageclient#enabled=0
let g:airline#extensions#virtualenv#enabled=0
let g:airline#extensions#poetv#enabled=0
let g:airline_detect_spell=1
let g:airline_detect_spelllang=0
let g:airline#extensions#fugitiveline#enabled = 1
" hide mode indicator for the desired common case
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" skip empty secionts
let g:airline_skip_empty_sections=1

" theming
let g:airline_powerline_fonts=0
let g:airline_left_sep='▙'
let g:airline_right_sep='▟'
" make things more compact
let g:airline_mode_map={
    \ '__': '-',
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'c' : 'C',
    \ 'v' : 'V',
    \ 'V' : 'V',
    \ '': 'V',
    \ 's' : 'S',
    \ 'S' : 'S',
    \ '': 'S',
    \ 't' : 'T',
    \ }
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_symbols.spell='✓'
let g:airline_section_z='%4l/%L'

" better whitespace
autocmd vimrc FileType git DisableWhitespace
autocmd vimrc FileType diff DisableWhitespace
autocmd vimrc FileType help DisableWhitespace

" detect indent settings
let g:detectindent_preferred_expandtab=1
let g:detectindent_preferred_indent=4
" autocmd BufReadPost * :DetectIndent

" nerdtree modifications
" change cwd with nerd tree
let NERDTreeChDirMode=2

" grammarous settings
let g:grammarous#use_vim_spelllang=1
let g:grammarous#languagetool_cmd='languagetool'
let g:grammarous#show_first_error=1

set shortmess+=c

" javascript settings
let g:jsx_ext_required=1

" Remove some stuff for special windows
autocmd vimrc BufReadPost fugitive://* setlocal nospell foldcolumn=0 nonumber norelativenumber
autocmd vimrc FileType git setlocal nospell signcolumn=no nonumber norelativenumber
autocmd vimrc FileType gitcommit setlocal signcolumn=no foldcolumn=0 nonumber norelativenumber
autocmd vimrc TermOpen * setlocal nonumber norelativenumber signcolumn=no foldcolumn=0
autocmd vimrc WinEnter * if &previewwindow | setlocal nospell nonumber norelativenumber signcolumn=no foldcolumn=0 | endif
autocmd vimrc FileType help setlocal signcolumn=no foldcolumn=0 nospell

" taboo settings
let g:taboo_tabline=0

" JSON highlighting settings
let g:vim_json_syntax_conceal=0 " do not remove double quotes in view

" latex settings
let g:tex_flavor="latex"
let g:Tex_DefaultTargetFormat =" pdf"
let g:Tex_IgnoredWarnings =''

" signify
let g:signify_vcs_list=[ 'git', 'svn', 'hg' ]
autocmd BufDelete COMMIT_EDITMSG SignifyRefresh

" fugitive
" automatically delete fugitive buffers
autocmd vimrc BufReadPost fugitive://* setlocal bufhidden=delete

" python folding
let g:SimpylFold_docstring_preview=1

let g:python_highlight_space_errors=0
let g:python_highlight_all=1

set undodir=~/.cache/nvim/undo/
set undofile

" default coc settings
let g:coc_global_extensions = [
  \   'coc-yank',
  \   'coc-word',
  \   'coc-vimlsp',
  \   'coc-ultisnips',
  \   'coc-tag',
  \   'coc-syntax',
  \   'coc-omni',
  \   'coc-highlight',
  \   'coc-git',
  \   'coc-emoji',
  \   'coc-dictionary',
  \   'coc-diagnostic',
  \   'coc-python',
  \   'coc-yaml',
  \   'coc-java',
  \   'coc-json',
  \   'coc-css',
  \   'coc-xml',
  \   'coc-markdownlint',
  \   'coc-lists',
  \   'coc-actions',
  \   'coc-sh',
  \   'coc-docker',
  \   'coc-html',
  \   'coc-svg',
  \ ]

" fix editing modes to file types
autocmd vimrc BufRead,BufNewFile rsb.conf set filetype=dosini
autocmd vimrc BufRead,BufNewFile *.ics set filetype=icalendar
autocmd vimrc BufRead,BufNewFile *.bbx set filetype=tex
autocmd vimrc BufRead,BufNewFile *.cbx set filetype=tex
autocmd vimrc BufNewFile,BufReadPost *.md set filetype=markdown
autocmd vimrc BufNewFile,BufReadPost *.md.erb set filetype=markdown

" clap settings
let g:clap_layout = {'relative': 'editor'}
let g:clap_theme = 'material_design_dark'
function! ConfigureClap() abort
    call g:clap.display.setbufvar('&spell', 0)
    call g:clap.display.setbufvar('&relativenumber', 0)
endfunction
autocmd vimrc User ClapOnEnter call ConfigureClap()

" key bindings to open navigation aids
nmap <leader>n :NERDTreeToggle <CR>
map <leader>u :MundoToggle <CR>
map <leader>i :IndentGuidesToggle <CR>
map <leader>b :Clap buffers <CR>
map <leader>c :Clap command<CR>
map <leader>r :Clap registers <CR>
map <leader>y :Clap yanks <CR>
map <leader>p :Clap files <CR>
map <leader>g :Clap gfiles <CR>
map <leader>e :Clap grep ++query=<cword> <CR>
map <leader>tt :TestLast <CR>
map <leader>tf :TestFile <CR>
map <leader>ts :TestSuite <CR>
map <leader>tn :TestNearest <CR>

" l used by latex

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

map <leader>sh :call <SID>show_documentation()<CR>
map <leader>sd <Plug>(coc-definition)
map <leader>sr <Plug>(coc-rename)
map <leader>sl <Plug>(coc-codelens-action)
map <leader>ss :<C-u>CocList outline<cr>
map <leader>sw :<C-u>CocList -I symbols<cr>
nmap <leader>sf <Plug>(coc-format)
vmap <leader>sf <Plug>(coc-format-selected)
map <leader>sa <Plug>(coc-codeaction)
xmap <leader>sa <Plug>(coc-codeaction-selected)
map <leader>sq <Plug>(coc-fix-current)

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

map <leader>w :w<CR>

function! DeleteBuffer()
    if &buftype ==# 'terminal'
        Bdelete!
    else
        Bdelete
    endif
endfunction
map <leader>q :call DeleteBuffer()<CR>

" UltiSnips settings
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
let g:UltiSnipsListSnippets="<A-tab>"

" markdown
let g:markdown_enable_mappings=0

" settings for neovim terminals
autocmd vimrc TermOpen * setlocal nospell
autocmd vimrc TermOpen * set bufhidden=hide
command! Fish :terminal fish
" autocmd vimrc BufEnter * if &buftype == 'terminal' | :startinsert | endif
set scrollback=-1
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" mappings for navigating between windows with alt+homerow
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
inoremap <A-h> <Esc><C-w>h
inoremap <A-j> <Esc><C-w>j
inoremap <A-k> <Esc><C-w>k
inoremap <A-l> <Esc><C-w>l

" Handle tmux $TERM quirks in vim
map <Esc>OH <Home>
map! <Esc>OH <Home>
map <Esc>OF <End>
map! <Esc>OF <End>

" leader combination to stop search highlighting
map <leader>h :nohlsearch <CR>

" vimtest config
let test#strategy="neovim"

" zeavim config
let g:zv_file_types = {
    \   'py': 'python,pandas,numpy',
    \ }

" make vimtex work with neovim
let g:vimtex_compiler_progname='nvr'
let g:vimtex_view_use_temp_files=2
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0 " do not open the quickfix window automatically

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
command! W w
command! Q q

command! CopyFileLine let @+=expand("%") . ':' . line(".")

command! PlugLoadAll call plug#load(keys(g:plugs))

function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" system-specific changes
if filereadable(glob("~/.config/nvim/local.vim"))
    source ~/.config/nvim/local.vim
endif
