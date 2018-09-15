
call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/xml.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'nvie/vim-flake8'

Plug 'neomake/neomake'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/wildfire.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'matze/vim-move'
Plug 'pbrisbin/vim-mkdir'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jnurmine/Zenburn'


" Plug '...'
" ...
call plug#end()

"主题设置
colorscheme zenburn

" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:□
" " 高亮当前行
set cursorline
" " 显示行号
set number
" " 高亮
syntax on

"""
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
"""

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Settings for Golang
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def-tab)

"Powerline setting
let g:airline_theme='molokai'
"Set GUI font type
if has("gui_running")
let g:airline_powerline_fonts = 1
set guifont=Source\ Code\ Pro\ for\ Powerline\ :h18
endif

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"Setup SuperTab
let g:SuperTabRetainCompletionType="context"

" 设定文件浏览器目录为当前目录
set bsdir=buffer
"设置编码
set encoding=utf-8
set nocompatible
set laststatus=2
" 设置文件编码
set fenc=utf-8
"set to use clipboard of system
set clipboard=unnamed

" 设置文件编码检测类型及支持格式
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"settings for backspace
set backspace=2
set backspace=indent,eol,start

"忽略大小写查找
set ic

" tab宽度
set tabstop=4
set cindent shiftwidth=4
set autoindent shiftwidth=4

" set 折叠
set foldmethod=indent
" 打开文件默认不折叠
set foldlevelstart=99

" set my leader
let mapleader="\<Space>"
let g:mapleader="\<Space>"

" tabs
nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove

" Settings for vim-easymotion
let g:EasyMotion_leader_key = ","

"Settings for TagBar
map <leader>g :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin' : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
	\ }


"switch window
map <leader>w <C-W>w

"set zen coding
let g:user_zen_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \  'erb' : {
  \    'extends' : 'html',
  \  },
  \}


if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*.gif,*.jpeg,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

au BufNewFile,BufRead *.py
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

au BufNewFile,BufRead *.c
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix


au BufNewFile,BufRead *.js, *.html, *.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

au BufNewFile,BufRead *.vimrc
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4


autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/'


let g:ackprg = 'ag --nogroup --nocolor --column'
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

map <F5> :call CompileRun()<CR>
func! CompileRun()
	▸   exec "w"
	▸   if &filetype == 'c'
	▸   ▸   exec "!g++ % -o %<"
	▸   ▸   exec "!time ./%<"
	▸   elseif &filetype == 'cpp'
	▸   ▸   exec "!g++ % -o %<"
	▸   ▸   exec "!time ./%<"
	▸   elseif &filetype == 'java'
	▸   ▸   exec "!javac %<"
	▸   ▸   exec "!time java %<"
	▸   elseif &filetype == 'sh'
	▸   ▸   :!time bash %
	▸   elseif &filetype == 'python'
	▸   ▸   exec "!time python %"
	▸   elseif &filetype == 'go'
	▸   ▸   exec "!time go run %"
	▸   endif
endfunc

autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <F2> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

