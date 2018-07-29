if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" WebAssembly text format is S-expression. We can reuse LISP indentation
setlocal lisp
setlocal indentexpr=

let b:undo_indent = "setl lisp< indentexpr<"
