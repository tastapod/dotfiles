" Editing
set ai sw=2 ts=2 sts=2 et
set fo=tcrqwn
set showmatch matchtime=5
syntax on
filetype plugin indent on

" Searching
set incsearch hlsearch
set ignorecase smartcase
set tags=tags,./tags
nmap <silent> <C-h> <Esc>:call ToggleHLSearch()<CR>

function ToggleHLSearch()
  if &hls
    set nohls
  else
    set hls
  endif
endfunction

" Commands
set wildmode=longest:full

" Where to store .swp files
set directory=/tmp//

" Navigating windows
nmap <C-N> <C-W>w
nmap <C-P> <C-W>W
set hidden
set equalalways
set mouse=a

" Let %% expands to directory of %
cabbr <expr> %% expand('%:p:h')

" Editor behaviour
set autowrite
set whichwrap=<,>,h,l,[,]
set background=dark
"colorscheme desert
set cursorline
highlight CursorLine cterm=none ctermbg=darkgrey
highlight MatchParen cterm=bold ctermbg=none ctermfg=none

" Ruby
autocmd BufRead,BufNewFile *.rb,*.rake,Rakefile    set ts=2 sw=2 nu

" Scala
autocmd BufRead,BufNewFile *.scala          set ts=2 sw=2 nu

" Clojure
autocmd BufRead,BufNewFile *.clj            set ts=2 sw=2 nu
autocmd BufRead,BufNewFile *.clj            nmap ,s <Plug>ClojureEvalToplevel
autocmd BufRead,BufNewFile *.clj            nmap ,f <Plug>ClojureEvalFile
autocmd BufRead,BufNewFile *.clj            nmap ,b <Plug>ClojureEvalBlock
autocmd BufRead,BufNewFile *.clj            nmap ,d <Plug>ClojureDocLookupWord
autocmd BufRead,BufNewFile *.clj            nmap ,i <Plug>ClojureDocLookupInteractive
autocmd BufRead,BufNewFile *.clj            nmap ,j <Plug>ClojureJavadocLookupWord
autocmd BufRead,BufNewFile *.clj            nmap ,r <Plug>ClojureStartRepl

let g:clj_want_gorilla = 1
let g:clj_highlight_builtins = 1
let g:clj_highlight_contrib = 1
"let maplocalleader = ","

" Shell scripts
let g:is_bash=1
"let g:sh_fold_enabled=7
autocmd BufNewFile,BufRead *.inc            set filetype=sh
