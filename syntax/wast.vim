if exists("b:current_syntax")
  finish
endif

syn cluster wastCluster       contains=wastModuleKeyword,wastInst,wastString,wastNamedVar,wastUnnamedVar,wastFloat,wastNumber,wastComment,wastList,wastType
syn keyword wastModuleKeyword module export func contained
syn match   wastInst          "\%((\s*\)\@<=\<[[:alnum:]_.]\+\>" contained display
syn match   wastNamedVar      "$\+[^$][^[:space:])]*" contained display
syn match   wastUnnamedVar    "$\+\d\+" contained display
syn region  wastString        start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match   wastFloat         "-\=\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=" display contained
syn match   wastFloat         "-\=\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>" display contained
syn match   wastFloat         "-\=\d\+e[-+]\=\d\+[fl]\=\>" display contained
syn match   wastNumber        "\<-\=\d\+\>" display contained
syn match   wastNumber        "\<-\=0x\x\+\>" display contained
syn match   wastNumber        "\<-\=0o\o\+\>" display contained
syn region  wastComment       start=";;" end="$" display
syn region  wastComment       start="(;;\@!" end=";)"
syn region  wastList          matchgroup=wastListDelimiter start="(;\@!" matchgroup=wastListDelimiter end=";\@<!)" contains=@wastCluster
syn keyword wastType          i64 i32 i16 i8 i1 f64 f32 contained

syn sync lines=100

hi def link wastModuleKeyword PreProc
hi def link wastListDelimiter Delimiter
hi def link wastInst          Statement
hi def link wastString        String
hi def link wastNamedVar      Identifier
hi def link wastUnnamedVar    PreProc
hi def link wastFloat         Float
hi def link wastNumber        Number
hi def link wastComment       Comment
hi def link wastType          Type

let b:current_syntax = "wast"
