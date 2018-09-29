
call plug#begin('~/.vim/plugged')

" Plug '...'



" ... 

call plug#end()

"支持utf-8编码
set encoding=utf-8

"忽略大小写查找
set ic

" tab宽度
set tabstop=2
set cindent shiftwidth=2
set autoindent shiftwidth=2


" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:□
" " 高亮当前行
set cursorline
" " 显示行号
set number
" " 高亮
syntax on

"分割布局
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 代码缩进
au BufNewFile,BufRead *.py
                        \ set tabstop=4 |
                        \ set softtabstop=4 |
                        \ set shiftwidth=4 |
                        \ set textwidth=79 |
                        \ set expandtab |
                        \ set autoindent |
                        \ set fileformat=unix


au BufNewFile,BufRead *.vimrc
                        \ set tabstop=4 |
                        \ set softtabstop=4 |
                        \ set shiftwidth=4


"标记空白字符
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



"f5编译运行当前文件
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

