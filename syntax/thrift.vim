" Nikita Kouevda
" 2014/12/26

if version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syn region  thriftComment start='/\*' end='\*/' contains=thriftTodo
syn match   thriftComment '\%(#\|//\).*' contains=thriftTodo

syn region  thriftString start=+\z(['"]\)+ skip=+\\\\\|\\['"]+ end='\z1'
syn match   thriftNumber '[+-]\?\%(\%(\<\d+\)\?\.\|\<\)\d\+\%([Ee][+-]\?\d\+\)\?\>'
syn keyword thriftBoolean true false

syn keyword thriftKeyword extends throws

syn keyword thriftInclude include cpp_include

syn keyword thriftType void bool byte i16 i32 i64 double string binary slist map set list cpp_type
syn keyword thriftStorageClass const required optional oneway
syn keyword thriftStructure namespace enum senum struct union exception service
syn keyword thriftTypedef typedef

" NOTE: must be defined after thriftNumber to take priority
syn match   thriftSpecial '\<\d\+:'

syn keyword thriftTodo TODO FIXME XXX contained

if version >= 508 || !exists('did_thrift_syn_inits')
  if version < 508
    let did_thrift_syn_inits = 1
    command! -nargs=+ HiLink hi link <args>
  else
    command! -nargs=+ HiLink hi def link <args>
  endif

  HiLink thriftComment Comment
  HiLink thriftString String
  HiLink thriftNumber Number
  HiLink thriftBoolean Boolean
  HiLink thriftKeyword Keyword
  HiLink thriftInclude Include
  HiLink thriftType Type
  HiLink thriftStorageClass StorageClass
  HiLink thriftStructure Structure
  HiLink thriftTypedef Typedef
  HiLink thriftSpecial Special
  HiLink thriftTodo Todo

  delcommand HiLink
endif

let b:current_syntax = 'thrift'