"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('scrooloose/syntastic')

call dein#add('tpope/vim-fugitive')
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <expr> gr ':Ggrep -i ' .  expand('<cword>')

call dein#add('tpope/vim-markdown')
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

call dein#add('mattn/emmet-vim')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('aklt/plantuml-syntax')
syntax on

call dein#add('tobyS/pdv')
let g:pdv_template_dir = $HOME . "/.vim/dein/repos/github.com/tobyS/pdv/templates_snip"
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Author = "Ryosuke HAGIHARA <r-hagihara@infiniteloop.co.jp"
let g:pdv_cfg_Copyright = "Infiniteloop Co., Ltd."

nnoremap <buffer> <C-y> :call pdv#DocumentWithSnip()<CR>

call dein#add('tobyS/vmustache')
" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set number
set ignorecase
set directory=/tmp

let g:netrw_localrmdir='rm -r'

nmap J 10j
nmap K 10k
