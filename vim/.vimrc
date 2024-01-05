execute pathogen#infect()

syntax on
set ttyfast
set hlsearch
set nowrap

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"
" Enable X cliboard usage (too aggressive, each delte in vim overrides X clipboard)
"
"set clipboard^=unnamedplus

"
" Key bindings
"

map <Up> k
map <Down> j
map <Left> h
map <Right> l
map <Home> 0
map <End> $
map <PageUp> 30k
map <PageDown> 30j

" switch buffers faster
map <Space>bn :bn<cr>
map <Space>bp :bp<cr>
map <Space>bd :bd<cr>
map <Space>tn :set invnumber<cr>


" This is for vertical indenting
set list
set listchars=tab:\|\ 
" NOTE the space char after last backslash.

"
" General Theme colors
"

colorscheme molokai   " use this color scheme
set background=dark   " adapt colors for background
let g:molokai_original = 1
hi Visual  ctermfg=Black ctermbg=Yellow guifg=Black guibg=Yellow gui=none

" Change diff colors
hi DiffAdd    cterm=bold ctermfg=black ctermbg=10 gui=none guifg=black guibg=green
hi DiffDelete cterm=bold ctermfg=black ctermbg=9 gui=none guifg=black guibg=Red
hi DiffChange cterm=bold ctermfg=black ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffText   cterm=bold ctermfg=black ctermbg=88 gui=none guifg=bg guibg=Red

" Sets popup and selection colors
hi Pmenu guibg=darkred guifg=grey
hi PmenuSel guibg=black guifg=darkyellow
hi Pmenu ctermbg=lightgrey ctermfg=black
hi PmenuSel ctermbg=grey ctermfg=white

"
" Behaviour Settings
"
set showmatch 	" Show matching brackets.

" tabs
" size of a hard tabstop
set tabstop=4

" size of an indent
set shiftwidth=4

" filetype plugin indent on
" set expandtab

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" make tab insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set noexpandtab

function TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction
map <Space>tt mz:execute TabToggle()<CR>'z
" set autoindent

"
" Airline plugin settings
"

" Indent Guides
let g:indent_guides_guide_size = 1

" Airline config
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1

" Nerd tree config
map <Space>ft :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" close vim if the only open window is nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open nerd tree if vim was openened without any specific file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Ctrlp config
let g:ctrlp_map = '<Space>ff'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'


" Magit config
map <Space>gs :Magit<CR>

" Haskell Syntax
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


