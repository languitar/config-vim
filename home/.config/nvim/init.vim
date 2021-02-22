scriptencoding utf8

" bundle settings
filetype off

" Disable some polyglot packages
let g:polyglot_disabled = ['latex', 'markdown']

call plug#begin('~/.local/share/nvim/bundle/')

" general configuration
Plug 'chriskempson/base16-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-clap', {'tag': 'v*', 'do': ':Clap install-binary'}
Plug 'gcmt/taboo.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/visualrepeat'
Plug 'wellle/targets.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'moll/vim-bbye'

" completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'chrisbra/unicode.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'roryokane/detectindent'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tomtom/tcomment_vim'
Plug 'sk1418/Join'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/vim-easy-align'
Plug 'sbdchd/neoformat'
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
Plug 'vigoux/LanguageTool.nvim'

" language support
Plug 'sheerun/vim-polyglot', {'tag': 'v*'}
Plug 'lervag/vimtex', {'tag': 'v*'}
Plug 'Rykka/riv.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'bps/vim-textobj-python'
Plug 'tmhedberg/SimpylFold'
Plug 'jamessan/vim-gnupg'
Plug 'chrisbra/csv.vim'
Plug 'vim-scripts/icalendar.vim'
Plug 'junegunn/vader.vim'
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
Plug 'gutenye/json5.vim'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'rasjani/robotframework-vim'
Plug 'towolf/vim-helm'
Plug 'plasticboy/vim-markdown'
Plug 'gurpreetatwal/vim-avro'
Plug 'stsewd/sphinx.nvim', { 'do': ':UpdateRemotePlugins' }

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
let g:airline_theme='base16_bright'
colorscheme base16-bright

" solid utf-8 lines for splits
set fillchars=vert:\│

" recommended by vim-sandwich (and never used)
nmap s <Nop>
xmap s <Nop>
let g:sandwich#recipes=deepcopy(g:sandwich#default_recipes)

" indent guides
let g:indent_guides_default_mapping=0
let g:indent_guides_auto_colors=1

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
let g:airline#extensions#taboo#enabled=1
let g:airline#extensions#ale#enabled=0
let g:airline#extensions#languageclient#enabled=0
let g:airline#extensions#virtualenv#enabled=0
let g:airline#extensions#poetv#enabled=0
let g:airline#extensions#coc#enabled=0
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

" detect indent settings
let g:detectindent_preferred_expandtab=1
let g:detectindent_preferred_indent=4
" autocmd BufReadPost * :DetectIndent

" nerdtree modifications
" change cwd with nerd tree
let NERDTreeChDirMode=2
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.egg-info$', '\.egg$', '__pycache__']

" grammarous settings
let g:grammarous#use_vim_spelllang=1
let g:grammarous#languagetool_cmd='languagetool'
let g:grammarous#show_first_error=1

set shortmess+=c

" javascript settings
let g:jsx_ext_required=1

" Remove some stuff for special windows
autocmd vimrc BufReadPost fugitive://* setlocal nospell foldcolumn=0 nonumber norelativenumber
autocmd vimrc TermOpen * setlocal nonumber norelativenumber signcolumn=no foldcolumn=0
autocmd vimrc WinEnter * if &previewwindow | setlocal nospell nonumber norelativenumber signcolumn=no foldcolumn=0 | endif

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
  \   'coc-cmake',
  \   'coc-conventional',
  \   'coc-css',
  \   'coc-diagnostic',
  \   'coc-dictionary',
  \   'coc-docker',
  \   'coc-emoji',
  \   'coc-fish',
  \   'coc-git',
  \   'coc-go',
  \   'coc-highlight',
  \   'coc-html',
  \   'coc-java',
  \   'coc-jira-complete',
  \   'coc-json',
  \   'coc-lists',
  \   'coc-markdownlint',
  \   'coc-omni',
  \   'coc-pyright',
  \   'coc-sh',
  \   'coc-sql',
  \   'coc-svg',
  \   'coc-swagger',
  \   'coc-syntax',
  \   'coc-tag',
  \   'coc-toml',
  \   'coc-ultisnips',
  \   'coc-vimlsp',
  \   'coc-vimtex',
  \   'coc-word',
  \   'coc-xml',
  \   'coc-yaml',
  \   'coc-yank',
  \   'coc-bibtex',
  \ ]

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
map <leader>p :Clap gfiles <CR>
map <leader>P :Clap files --hidden <CR>
map <leader>e :Clap grep ++query=<cword> <CR>
map <leader>tt :TestLast <CR>
map <leader>tf :TestFile <CR>
map <leader>ts :TestSuite <CR>
map <leader>tn :TestNearest <CR>

" l used by latex

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
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

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <c-n> pumvisible() ? "\<C-n>" : coc#refresh()

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

map <leader>w :w<CR>
map <leader>q :call myhelpers#DeleteBuffer()<CR>

" UltiSnips settings
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
let g:UltiSnipsListSnippets="<A-tab>"

" markdown
let g:markdown_enable_mappings=0
let g:vim_markdown_frontmatter=1

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

command! -bar SpellLegend call myhelpers#SpellLegend()

" utility commands
command! W w
command! Q q

command! CopyFileLine let @+=expand("%") . ':' . line(".")

command! PlugLoadAll call plug#load(keys(g:plugs))

" system-specific changes
if filereadable(glob("~/.config/nvim/local.vim"))
    source ~/.config/nvim/local.vim
endif
