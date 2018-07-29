if exists("b:current_syntax")
    finish
endif

syn cluster wastCluster       contains=wastModuleKeyword,wastInst,wastString,wastNamedVar,wastUnnamedVar,wastFloat,wastNumber,wastComment,wastList,wastType
syn keyword wastModuleKeyword module export contained

" https://webassembly.github.io/spec/core/text/instructions.html
syn match   wastInst          "\%((\s*\)\@<=\<\%(\%(i32\|i64\|f32\|f64\|memory\)\.\)\=[[:alnum:]_]\+\>\%(\s\+\%(align\|offset\)=\)\=" contained display

" https://webassembly.github.io/spec/core/text/values.html#text-id
syn match   wastNamedVar      "$\+[[:alnum:]!#$%&'∗./:=><?@\\^_`~+-]*" contained display
syn match   wastUnnamedVar    "$\+\d\+[[:alnum:]!#$%&'∗./:=><?@\\^_`~+-]\@!" contained display

" https://webassembly.github.io/spec/core/text/values.html#strings
syn region  wastString        start=+"+ skip=+\\\\\|\\"+ end=+"+ contained contains=wastStringSpecial
syn match   wastStringSpecial "\\\x\x\|\\[tnr'\\\"]\|\\u\x\+" contained containedin=wastString

" https://webassembly.github.io/spec/core/text/values.html#floating-point
syn match   wastFloat         "\<-\=\d\%(_\=\d\)*\%(\.\d\%(_\=\d\)*\)\=\%([eE][-+]\=\d\%(_\=\d\)*\)\=" display contained
syn match   wastFloat         "\<-\=0x\x\%(_\=\d\)*\%(\.\x\%(_\=\x\)*\)\=\%([pP][-+]\=\d\%(_\=\d\)*\)\=" display contained
syn keyword wastFloat         inf nan contained

" https://webassembly.github.io/spec/core/text/values.html#integers
syn match   wastNumber        "\<-\=\d\%(_\=\d\)*\>" display contained
syn match   wastNumber        "\<-\=0x\x\%(_\=\x\)*\>" display contained

" https://webassembly.github.io/spec/core/text/lexical.html#comments
syn region  wastComment       start=";;" end="$" display
syn region  wastComment       start="(;;\@!" end=";)"

syn region  wastList          matchgroup=wastListDelimiter start="(;\@!" matchgroup=wastListDelimiter end=";\@<!)" contains=@wastCluster

" https://webassembly.github.io/spec/core/text/types.html
syn keyword wastType          i64 i32 f64 f32 func param result anyfunc mut contained

syn sync lines=100

hi def link wastModuleKeyword PreProc
hi def link wastListDelimiter Delimiter
hi def link wastInst          Statement
hi def link wastString        String
hi def link wastStringSpecial Special
hi def link wastNamedVar      Identifier
hi def link wastUnnamedVar    PreProc
hi def link wastFloat         Float
hi def link wastNumber        Number
hi def link wastComment       Comment
hi def link wastType          Type

let b:current_syntax = "wast"
