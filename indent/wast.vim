if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal comments=s:(;,e:;),:;;
setlocal commentstring=(;%s;)
setlocal formatoptions-=t

" WebAssembly text format is S-expression. We can reuse LISP indentation
setlocal lisp

let b:undo_indent = "setl comments< commentstring< formatoptions< lisp<"
