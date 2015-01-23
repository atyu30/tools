" Version 20121109
map <F4> ms:call TitleDet()<cr>'s
" shell 脚本添加头
function AddTitle()
    call append(0,"#/bin/sh")
    call append(1,"#")
    call append(2,"# Author: atyu30 <iopenbsd@gmail.com>")
    call append(3,"#")
    call append(4,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"#")
    call append(6,"# Filename: ".expand("%:t"))
    call append(7,"#")
    call append(8,"# Description: ")
    call append(9,"#")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

" 更新时间
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

function TitleDet()
    let n=1
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

" php 脚本添加头
autocmd bufnewfile *.php call setline(1,'<?php') |
    \ call setline(2,'/*') |
    \ call setline(3,' * @encoding: utf-8') |
    \ call setline(4,' * @FileName: '.expand('%:t')) |
    \ call setline(5,' * @Author: Atyu30 <ipostfix (at) gmail.com>') |
    \ call setline(6,' * @Version: '.strftime('%Y-%m-%d %H:%M')) |
    \ call setline(7,' * @Copyrigth:  http://www.atyu30.com/') |
    \ call setline(8,' * @Description:') |
    \ call setline(9,' *') |
    \ call setline(10,'*/') |
    \ call setline(11,'?>') |
    \ exe "normal G"

" 插入系统日期
map <F5> :r !date +\%c<CR>
" vim 中执行 python 文件
autocmd FileType sh map <C-J> :!. %<CR>
autocmd FileType php map <C-J> :!php %<CR>
autocmd FileType php,html,xhtml,htm,javascript,css map <C-I>
autocmd FileType python map <C-J> :!/usr/bin/env python %<CR>
autocmd FileType javascript map <C-J> :!js %<CR>

"Python文件中建议不出现Tab，而用空格代替，另外缩进量应为四个空格
autocmd FileType python setlocal et sta sw=4 sts=4

"pydiction 1.2 python 自动补全
filetype plugin on
let g:pydiction_localtion = '~/.vim/tools/pydiction/complete-dict'
"defalut g:pydiction_menu_height == 15
""let g:pydiction_menu_height = 20


" 打开行号
set nu et


"折叠
"set foldmethod=indent
"
"
"缩进定义
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab


" 重启后撤销历史可用 persistent undo 
"set undofile
"set undodir='~/.vim/undo'
"set undolevels=1000 "maximum number of changes that can be undone

"if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
"  if isdirectory($HOME . '/.vim/undo') == 0
"    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
"  endif
"  set undodir=./.vim-undo//
"  set undodir+=~/.vim/undo//
"  set undofile
"endif
"
"set fileencoding=utf-8
"set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936,gb2312,latin-1

" 2013/03/27
" python 脚本添加头
autocmd bufnewfile *.py call setline(1,'#!/usr/bin/env python') |
    \ call setline(2,'# encoding: utf-8') |
    \ call setline(3,'') |
    \ call setline(4,'# author: Atyu30 <ipostfix (at) gmail.com>') |
    \ call setline(5,'# filename: '.expand('%:t')) |
    \ call setline(6,'# version: '.strftime('%Y-%m-%d %H:%M')) |
    \ call setline(7,'# copyrigth:  http://www.atyu30.com/') |
    \ call setline(8,'# description: ') |
    \ call setline(9,'# ') |
    \ call setline(10,'def main(): ') |
    \ call setline(11,'    print "hello"')|
    \ call setline(12,'') |
    \ call setline(13,'') |
    \ call setline(14,"if __name__ == '__main__':")|
    \ call setline(15,'    main()')|
    \ exe "normal G"

" 2013/06/26
" 解决按键失灵：用 F8 代替 = ，用 F9 代替 +
imap <F8> =
imap <F9> +
