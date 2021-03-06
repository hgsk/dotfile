set number
set ignorecase

set backupdir=/tmp

let g:netrw_localrmdir='rm -r'

nmap J 10j
nmap K 10k

syntax on
let php_folding=1
color desert

if &compatible
  set nocompatible
endif

tnoremap <silent> <ESC> <C-\><C-n>

" Required:
set runtimepath^=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
let g:neosnippet#snippets_directory = '~/.vim/snippets/'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

call dein#add('scrooloose/syntastic')
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_php_phpmd_post_args='codesize,design,unusedcode'
call dein#add('tpope/vim-fugitive')
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <expr> gr ':Ggrep -i ' .  expand('<cword>')

call dein#add('tpope/vim-markdown')
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

call dein#add('mattn/emmet-vim')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('aklt/plantuml-syntax')
syntax on

call dein#add('sjl/badwolf')
call dein#add('tobyS/pdv')
let g:pdv_template_dir = $HOME . "/.vim/dein/repos/github.com/tobyS/pdv/templates_snip"
let g:pdv_cfg_Type = "mixed"

nnoremap <buffer> <C-y> :call pdv#DocumentWithSnip()<CR>

call dein#add('tobyS/vmustache')
call dein#add('arnaud-lb/vim-php-namespace')
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/unite.vim')

" call dein#add('m2mdas/phpcomplete-extended')
" autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
" let g:phpcomplete_index_composer_command = '/usr/local/bin/composer'

call dein#add('elzr/vim-json')

call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/neopairs.vim')
call dein#add('Shougo/echodoc.vim')
call dein#add('Shougo/neoinclude.vim')
call dein#add('Konfekt/FastFold')
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/deoplete.nvim/

call dein#add('tpope/vim-dispatch')
call dein#add('OmniSharp/omnisharp-vim', { 'do': 'sh -c "cd server/ && xbuild"', 'on_ft': 'cs' })
call dein#add('https://gitlab.com/mixedCase/deoplete-omnisharp.git', { 'on_ft': 'cs' })

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert

call dein#add('fntlnz/atags.vim')
autocmd BufWritePost * call atags#generate()


" You can specify revision/branch/tag.
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

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

" Jq Command
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction
