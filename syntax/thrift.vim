if exists('b:current_syntax')
  finish
endif

syn region  thriftComment start='/\*' end='\*/' contains=thriftTodo,@Spell
syn match   thriftComment '\%(#\|//\).*' contains=thriftTodo,@Spell

syn region  thriftString start=+\z(['"]\)+ end=+\z1\|$+ contains=thriftEscape,thriftEscapeError,@Spell
syn match   thriftEscapeError '\\.' contained
syn match   thriftEscape +\\[\\"'nrt]+ contained

syn match   thriftNumber '[+-]\?\<\d\+\%([Ee][+-]\?\d\+\)\?\>'
syn match   thriftNumber '[+-]\?\%(\<\d+\)\?\.\d\+\%([Ee][+-]\?\d\+\)\?\>'
syn match   thriftNumber '\<0x[0-9A-Fa-f]\+\>'

syn keyword thriftBoolean true false

syn match   thriftIdentifier '\%(+\|\<\)0*[1-9]\d*\s*:'

syn keyword thriftKeyword extends throws

syn keyword thriftInclude namespace include cpp_include

syn keyword thriftType bool byte i8 i16 i32 i64 double string binary slist
syn keyword thriftType void map set list cpp_type
syn keyword thriftStorageClass const required optional oneway
syn keyword thriftStructure enum senum struct union exception service nextgroup=thriftName skipwhite
syn keyword thriftTypedef typedef

syn match   thriftName '\<[A-Z_]\w*' contained

syn keyword thriftTodo TODO FIXME XXX NOTE contained

hi def link thriftComment Comment

hi def link thriftString String
hi def link thriftNumber Number
hi def link thriftBoolean Boolean

hi def link thriftIdentifier Identifier

hi def link thriftKeyword Keyword

hi def link thriftInclude Include

hi def link thriftType Type
hi def link thriftStorageClass StorageClass
hi def link thriftStructure Structure
hi def link thriftTypedef Typedef

hi def link thriftName Special
hi def link thriftEscape SpecialChar

hi def link thriftEscapeError Error

hi def link thriftTodo Todo

let b:current_syntax = 'thrift'
