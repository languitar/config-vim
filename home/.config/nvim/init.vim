scriptencoding utf8

" bundle settings
filetype off

call plug#begin('~/.local/share/nvim/bundle/')

" general configuration
Plug 'sjl/badwolf'
Plug 'vim-scripts/mayansmoke'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/neoyank.vim'
Plug 'gcmt/taboo.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'BurningEther/iron.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-obsession'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/visualrepeat'
Plug 'wellle/targets.vim'
Plug 'editorconfig/editorconfig-vim'

" completion
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'chrisbra/unicode.vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'make release'}

" SCM support
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
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

" language support
Plug 'lervag/vimtex'
Plug 'Rykka/riv.vim', {'for': 'rst'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'vim-python/python-syntax', {'for': ['python', 'python3']}
Plug 'hynek/vim-python-pep8-indent', {'for': ['python', 'python3']}
Plug 'kana/vim-textobj-user', {'for': ['python', 'python3']}
Plug 'bps/vim-textobj-python', {'for': ['python', 'python3']}
Plug 'tmhedberg/SimpylFold', {'for': ['python', 'python3']}
Plug 'jamessan/vim-gnupg'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'vim-scripts/icalendar.vim', {'for': 'icalendar'}
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'jsx'}
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'junegunn/vader.vim'
Plug 'janko-m/vim-test'
Plug 'carlitux/deoplete-ternjs', {'for': 'javascript', 'do': 'npm install -g tern'}
Plug 'gko/vim-coloresque'
Plug 'rodjek/vim-puppet'

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

set fileformats=unix,dos,mac " set newline preferences

" default indentation settings
set expandtab
set shiftwidth=4
set tabstop=4

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

" bracket matching settings
highlight MatchParen cterm=bold ctermbg=none ctermfg=9

" tab completion mode with partial match and list
set wildmode=list:longest,full

" allow mouse control
set mouse=a

" avoid delays when exiting insert mode with escape
set ttimeoutlen=0

" put leader to space
map <space> <leader>
map <space><space> <leader><leader>

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

" solid utf-8 lines for splits
set fillchars=vert:\│

" recommended by vim-sandwich (and never used)
nmap s <Nop>
xmap s <Nop>
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" indent guides
let g:indent_guides_default_mapping = 0
let g:indent_guides_auto_colors = 0
highlight IndentGuidesOdd  guibg=red   ctermbg=234
highlight IndentGuidesEven guibg=green ctermbg=236

" status line modification
let g:airline#extensions#tabline#enabled = 1
" already visible in gutter
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 1
" not needed
let g:airline#extensions#branch#enabled = 0
" already done by another plugin
let g:airline#extensions#whitespace#checks =[' indent', 'mixed-indent-file']
let g:airline_powerline_fonts = 0
let g:airline_left_sep = '▙'
let g:airline_right_sep = '▟'
" make things more compact
let g:airline_mode_map = {
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
    \ }
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.spell = '✓'
let g:airline_section_z = '%4l/%L'

" detect indent settings
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
" autocmd BufReadPost * :DetectIndent

" nerdtree modifications
" change cwd with nerd tree
let NERDTreeChDirMode = 2

" ale settings
let g:ale_echo_msg_format = '[%linter%] %s% (code)% [%severity%]'
let g:ale_linters = {
    \ 'tex': ['alex', 'proselint', 'chktex', 'write-good', 'vale'],
    \ 'python': ['flake8'],
    \ }
let g:ale_lint_on_text_changed = 'never'
highlight ALEError cterm=undercurl ctermfg=196
highlight ALEInfo cterm=undercurl ctermfg=14

" grammarous settings
let g:grammarous#use_vim_spelllang = 1
let g:grammarous#languagetool_cmd = 'languagetool'
let g:grammarous#show_first_error = 1

" deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_menu_width = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_smart_case = 1
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
let g:clang_use_library = 1
let g:clang_complete_macros = 1
let g:clang_auto_user_options = 'compile_commands.json'
" let g:clang_complete_patterns = 1

" javascript settings
let g:jsx_ext_required = 1
let g:deoplete#sources#ternjs#types = 1

" language server stuff
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'dockerfile': ['docker-langserver', '--stdio'],
    \ 'html': ['html-languageserver', '--stdio'],
    \ 'java': ['jdtls', '-data', '~/.local/share/nvim/ls/java', '--add-modules=ALL-SYSTEM', '--add-opens', 'java.base/java.util=ALL-UNNAMED', '--add-opens', 'java.base/java.lang=ALL-UNNAMED'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'json': ['json-languageserver', '--stdio'],
    \ 'less': ['css-languageserver', '--stdio'],
    \ 'puppet': ['puppet-languageserver', '--stdio'],
    \ 'python': ['pyls'],
    \ 'rust': ['rls'],
    \ 'sass': ['css-languageserver', '--stdio'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'xml': ['xml-language-server'],
    \ 'yaml': ['yaml-language-server', '--stdio'],
    \ }

" Automatically start language servers.
" let g:LanguageClient_autoStart = 0
let g:LanguageClient_settingsPath = 'ls-settings.json'
let g:LanguageClient_hoverPreview = 'Always'

" Denite settings
" git file source
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])
" git grep source
call denite#custom#alias('source', 'grep/git', 'grep')
call denite#custom#var('grep/git', 'command',
    \ ['git'])
call denite#custom#var('grep/git', 'default_opts',
        \ ['grep', '-n', '-P'])
call denite#custom#var('grep/git', 'recursive_opts', ['--recurse-submodules'])
call denite#custom#var('grep/git', 'pattern_opt', ['-e'])
call denite#custom#var('grep/git', 'separator', ['--'])
call denite#custom#var('grep/git', 'final_opts', ['.'])

" maps for navigating entries up and downwards
call denite#custom#map(
    \ 'insert',
    \ '<Down>',
    \ '<denite:move_to_next_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<C-j>',
    \ '<denite:move_to_next_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<C-n>',
    \ '<denite:move_to_next_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<Up>',
    \ '<denite:move_to_previous_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<C-k>',
    \ '<denite:move_to_previous_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<C-p>',
    \ '<denite:move_to_previous_line>',
    \ 'noremap'
    \)

" lru sorting for buffers
call denite#custom#source('buffer', 'sorters', [])

" better colors
call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'None')

" disable spell checking here
autocmd vimrc FileType denite setlocal nospell

" disable line numbers in terminal
autocmd vimrc TermOpen * setlocal nonumber norelativenumber

" taboo settings
let g:taboo_tabline = 0

" JSON highlighting settings
let g:vim_json_syntax_conceal = 0 " do not remove double quotes in view

" latex settings
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat =" pdf"
let g:Tex_IgnoredWarnings =''

" signify
let g:signify_vcs_list = [ 'git', 'svn', 'hg' ]
autocmd vimrc User Fugitive SignifyRefresh

" python folding
let g:SimpylFold_docstring_preview = 1

let g:python_highlight_operators = 0
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

set undodir=~/.cache/nvim/undo/
set undofile

" fix editing modes to file types
autocmd vimrc BufRead,BufNewFile rsb.conf set filetype=dosini
autocmd vimrc BufRead,BufNewFile *.project set filetype=json
autocmd vimrc BufRead,BufNewFile *.template set filetype=json
autocmd vimrc BufRead,BufNewFile *.distribution set filetype=json
autocmd vimrc BufRead,BufNewFile *.ics set filetype=icalendar
autocmd vimrc BufRead,BufNewFile *.bbx set filetype=tex
autocmd vimrc BufRead,BufNewFile *.cbx set filetype=tex
autocmd vimrc BufNewFile,BufReadPost *.md set filetype=markdown
autocmd vimrc BufNewFile,BufReadPost *.md.erb set filetype=markdown

" key bindings to open navigation aids
nmap <leader>n :NERDTreeToggle <CR>
map <leader>t :TagbarToggle <CR>
map <leader>u :MundoToggle <CR>
map <leader>i :IndentGuidesToggle <CR>
map <leader>b :Denite buffer <CR>
map <leader>r :Denite -resume <CR>
map <leader>p :DeniteProjectDir buffer file_rec <CR>
map <leader>g :Denite buffer file_rec/git <CR>
map <leader>e :Denite grep/git <CR>
map <leader>vp :Gpull --rebase<CR>
map <leader>vu :Gpush<CR>
map <leader>vs :Gstatus <CR>

" l used by latex

map <leader>sh :call LanguageClient_textDocument_hover()<CR>
map <leader>sd :call LanguageClient_textDocument_definition()<CR>
map <leader>sr :call LanguageClient_textDocument_rename()<CR>
map <leader>ss :Denite documentSymbol<CR>
map <leader>se :Denite references<CR>
map <leader>sw :Denite workspaceSymbol<CR>
nmap <leader>sf :call LanguageClient_textDocument_formatting()<CR>
vmap <leader>sf :call LanguageClient_textDocument_rangeFormatting()<CR>
map <leader>sa :Denite codeAction<CR>
map <leader>sju: :call LanguageClient#Notify("java/projectConfigurationUpdate", {'uri': "file://" . getcwd() . "/" . bufname("%")})

map <leader>c :Denite command<CR>

map <leader>w :w<CR>

" UltiSnips settings
let g:UltiSnipsEditSplit = "context"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
let g:UltiSnipsListSnippets = "<A-tab>"

" markdown
let g:markdown_enable_mappings = 0

" settings for neovim terminals
autocmd vimrc TermOpen * setlocal nospell
autocmd vimrc TermOpen * set bufhidden=hide
command! Fish :terminal fish
autocmd vimrc BufEnter * if &buftype == 'terminal' | :startinsert | endif
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

" make vimtex work with neovim
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_use_temp_files = 2
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0 " do not open the quickfix window automatically

" java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" deoplete completion for LaTeX
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

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

" Colorscheme switching
command! Light :colorscheme mayansmoke | :AirlineTheme molokai
command! Dark :colorscheme badwolf | :AirlineTheme badwolf

" utility commands
command! W w
command! Q q

command! CopyFileLine let @+=expand("%") . ':' . line(".")

command! PlugLoadAll call plug#load(keys(g:plugs))

" system-specific changes
if filereadable(glob("~/.config/nvim/local.vim"))
    source ~/.config/nvim/local.vim
endif
