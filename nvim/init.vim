syntax on

set mouse=a
set encoding=utf-8

set backspace=indent,eol,start
set list
set listchars=tab:-·,trail:·,lead:·

set foldmethod=indent
set foldlevel=99

set tabstop=4
set shiftwidth=4
set softtabstop=4

set scrolloff=5

set autochdir

let mapleader=" "

set number
set relativenumber
" set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
set incsearch
exec "nohlsearch"
set ignorecase
set smartcase
noremap <LEADER><CR> :nohlsearch<CR>

map ; :
map S :w<CR>
map Q :q<CR>

map s <nop>
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

map tu :tabnew<CR>
map <S-TAB> :tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <LEADER>sp :set spell!<CR>
" then press z= to modify spelling error.

" press <LEADER> twice to jump to the next '<++>'
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

call plug#begin('$HOME/.config/nvim/plugged')

" NERDTree
" Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Assistant lines
Plug 'theniceboy/eleline.vim'
Plug 'mg979/vim-xtabline'

" Undotree
Plug 'mbbill/undotree'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Ranger
Plug 'kevinhwang91/rnvimr'

" Multiple Cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'terryma/vim-multiple-cursors'

" Surround
Plug 'machakann/vim-sandwich'
" Plug 'tpope/vim-surround'

" Bookmarks
" Plug 'kshenoy/vim-signature'
" Plug 'chentoast/marks.nvim'

" Table
Plug 'dhruvasagar/vim-table-mode'

" Easymotion
Plug 'easymotion/vim-easymotion'

" Start page
Plug 'mhinz/vim-startify'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" NERDTree
" map ss :NERDTreeToggle<CR>

" NERDTree-git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ========== vim-startify ========== 
let g:startify_custom_header = startify#center(split(system('figlet -w 100 neovim'), '\n'))

let g:startify_session_dir = '~/.config/nvim/session'

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
			\ {'type': 'files',		'header': ['	Recent Files']},
			\ {'type': 'dir',		'header': ['	Current Directory '. getcwd()]},
			\ {'type': 'sessions',	'header': ['	Sessions']},
			\ {'type': 'bookmarks',	'header': ['	Bookmarks']},
			\ { 'type': function('s:gitModified'),  'header': ['   git modified']},
			\ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
			\ { 'type': 'commands',  'header': ['   Commands']       },
			\ ]

let g:startify_bookmarks = [
			\ {'c': '~/.config/i3/config'},
			\ {'i': '~/.config/nvim'},
			\ {'f': '~/.config/fish'},
	  \ ]

let g:startify_files_number = 10
let g:startify_fortune_use_unicode = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_enable_special = 0

" ========== vim-surround ========== 
" runtime macros/sandwich/keymap/surround.vim
xmap is <Plug>(textobj-sandwich-query-i)
xmap as <Plug>(textobj-sandwich-query-a)
omap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)

xmap im <Plug>(textobj-sandwich-literal-query-i)
xmap am <Plug>(textobj-sandwich-literal-query-a)
omap im <Plug>(textobj-sandwich-literal-query-i)
omap am <Plug>(textobj-sandwich-literal-query-a)

" ========== marks ========== 
" ========== vim-signature ========== 
noremap <M-s> :SignatureToggleSigns<CR>

let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "m<Space>",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "]`",
        \ 'GotoPrevSpotByPos'  :  "[`",
        \ 'GotoNextMarker'     :  "]-",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListBufferMarks'    :  "m/",
        \ 'ListBufferMarkers'  :  "m?"
        \ }

" ========== table-mode ========== 
noremap <LEADER>tm :TableModeToggle<CR>

" ========== Undotree ========== 
noremap <M-u> :UndotreeToggle<CR>

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

" ========== fzf ========== 
noremap <LEADER>f :Files<CR>

" ========== Rnvimr ========== 
map <M-r> :RnvimrToggle<CR>

" ========== vim-multiple ========== 
" let g:multi_cursor_use_default_mapping=0
" 
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<M-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<M-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ========== easymotion ==========
map <Leader> <Plug>(easymotion-prefix)

" ========== COC ==========

" === Global Config ===
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-clangd', 'coc-jedi', 'coc-explorer', 'coc-translator', 'coc-pairs']

set hidden

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-o> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <LEADER>h to show documentation in preview window.
nnoremap <silent> <LEADER>H :call ShowDocumentation()<CR>

function! ShowDocumentation()
"	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
"	else
"		call feedkeys('K', 'in')
"	endif
endfunction

" Symbol renaming.
nmap <LEADER>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<LEADER>aap` for current paragraph
xmap <LEADER>a  <Plug>(coc-codeaction-selected)
nmap <LEADER>a  <Plug>(coc-codeaction-selected)

" === PlugIn of COC ===
" explorer
map <M-e> :CocCommand explorer<CR>

" translator
" NOTE: do NOT use `nore` mappings
" popup
nmap <LEADER>ts <Plug>(coc-translator-p)
vmap <LEADER>ts <Plug>(coc-translator-pv)
" echo
nmap <LEADER>te <Plug>(coc-translator-e)
vmap <LEADER>te <Plug>(coc-translator-ev)
" replace
