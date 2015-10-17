scriptencoding utf-8
set encoding=utf-8
set nocompatible

let mapleader="'"

if !exists("syntax_on")
  syntax on
endif

function! SourceFiles()
  return ['bundles', 'functions', 'colors', 'sets', 'keymaps', 'autocommands']
endfunction

for file in map(SourceFiles(), '"~/.vimrc." . (v:val)')
  if filereadable(expand(file))
    exec('source ' . file)
  else
    echoerr(string(file) . ' not readable but present in SourceFiles())
  endif
endfor

filetype plugin indent on

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" summon CtrlP with <ctrl>+p
let g:ctrlp_map = '<C-p>'

" Let Ctrl+P open files in NerdTree's initial buffer
let g:ctrlp_dont_split = 'NERD'

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

if InTmuxSession()
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Change status line color to show mode
" first, enable status line always
set laststatus=2

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Red
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

" associate *.foo with filetype bar
au BufRead,BufNewFile *.jison setfiletype javascript

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" matchit -- for matching block delimiters
runtime macros/matchit.vim

" omnicomplete
set omnifunc=syntaxcomplete#Complete

" toggle NERDTree pane with ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Allow JSX in normal JS files
" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
"let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']

" C++11 for syntastic
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Coffee folding
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
