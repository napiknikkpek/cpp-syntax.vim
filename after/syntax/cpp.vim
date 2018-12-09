syn clear cType
syn clear cStructure
syn clear cStorageClass
syn clear cBlock
syn clear cBracket
syn clear cParen
syn clear cParenError

syn clear cppAccess
syn clear cppType
syn clear cppStructure
syn clear cppStatement

syn keyword cppStatement new delete this friend
syn keyword cppStatement new delete this friend contained

syn match cppNumber display "\<0b[01]\('\=[01]\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  \ contained
syn match cppNumber display "\<[1-9]\('\=\d\+\)*\(u\=l\{0,2}\|ll\=u\)\>" 
  \ contains=cFloat contained
syn match cppNumber display "\<0x\x\('\=\x\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  \ contained

syn keyword cppStatement static register volatile extern inline restrict alignas noreturn thread_local return decltype constexpr mutable
syn keyword cppStatement static register volatile extern inline restrict alignas noreturn thread_local return decltype constexpr mutable contained

syn match cppId '\I\i*'
syn match cppId '\I\i*' contained
syn match cppTypeId0 '\I\i*' contained
syn match cppId '\I\i*\_s*.'me=e-1 contained
syn match cppId '\I\i*\_s*->'me=e-2 contained
syn match cppId '\.\_s*\I\i*'ms=s+1 contained
syn match cppId '->\_s*\I\i*'ms=s+2 contained

syn match cppTypeIdL '\I\i*' contains=cppSpecial contained
syn match cppTypeIdL '::\_s*\I\i*'ms=s+2 contained

syn match cppTypeIdR '\(\_s\|[\*&]\)\I\i*'ms=s+1 
  \ contains=cppFuncDeclPre,cppFuncDecl,cppId,cppTypeDecl,cppTempParam,cppOperatorDecl
  \ contained

syn match cppPackIdR '\.\.\.\s*\I\i*'ms=s+3 
  \ contains=cppTypeId,cppId 
  \ contained

syn match cppTypeId '\I\i*\_s*{'me=e-1
syn match cppTypeId '\I\i*\_s*{'me=e-1 contained
syn match cppTypeId '\I\i*<'he=e-1 contains=cppTempContext
syn match cppTypeId '\I\i*\_s*::'me=e-2
syn match cppTypeId '\I\i*<'he=e-1 contains=cppTempContext contained
syn match cppTypeId '\I\i*\_s*::'me=e-2 contained

syn match cppFuncDeclPre '\I\i*\(<\(\_[^<>]*\(\(\I\i*<\_[^<>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)\)*\_[^<>]*>\)\?\_s*::\_s*\I'
  \ contains=cppFuncDeclPre,cppFuncDecl,cppTypeId,cppOperatorDecl
  \ contained

syn match cppFuncId '\I\i*\_s*('
syn match cppFuncId '\I\i*\_s*(' contained

syn match cppFuncId '\I\i*\(<\(\_[^<>]*\(\(\I\i*<\_[^<>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)\)*\_[^<>]*>\)\?\_s*('me=e-1 
  \ contains=cppTempContext

syn match cppFuncDecl '\I\i*\(<\(\_[^<>]*\(\(\I\i*<\_[^<>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)\)*\_[^<>]*>\)\?\_s*('he=e-1 
  \ contains=cppTempContext,cppParenDecl
  \ contained

syn match cppOperatorDecl 
  \ 'operator\_s*\([\*&+\-!~]=\?\|--\|++\|&&\|||\|()\|\_s\+new\_s*\(\[\]\)\?\|\_s\+delete\_s*\(\[\]\)\?\)\_s*(' 
  \ contains=cppParenDecl,cppStatement,cppOperator

syn match cppParenCall '(\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)'
  \ contains=cppId,cppTypeId,cppFuncId,cppSpecial,cppStatement,cppNumber,cppBoolean,cppCStyleCast
  \ contained

syn match cppParenDecl '(\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)'
  \ contains=cppIdDecl,cppTypeId0,cppTypeId,cppFuncId,cppSpecial,cppStatement,cppNumber,cppBoolean,cppConst
  \ contained

syn match cppCStyleCast 
  \ '(\(\_s*const\)\?\_s*\I\i*\(\_s\+const\)\?\(\_s*\(\*\|&\|&&\)\(\_s*const\)\?\)\?\_s*)\_s*\(\I\|(\)'me=e-1
  \ contains=cppConst,cppTypeId0,cppSpecial

syn match cppCStyleCast 
  \ '(\(\_s*const\)\?\_s*\I\i*\(\_s\+const\)\?\(\_s*\(\*\|&\|&&\)\(\_s*const\)\?\)\?\_s*)\_s*\(\I\|(\)'me=e-1
  \ contains=cppConst,cppTypeId0,cppSpecial
  \ contained

syn match cppTempContext '<\(\_[^<>]*\(\(\I\i*<\_[^<>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)\)*\_[^<>]*>' 
  \ contains=cppIdDeclJoin,cppTempParam,cppParenCall,cppTypeId0,cppTypeId,cppIdDecl,cppPackDecl,cppFuncId,cppSpecial,cppStatement,cppNumber,cppBoolean
  \ contained

syn match cppTempDeclContext '<\(\_[^<>]*\(\(\I\i*<\_[^<>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)\)*\_[^<>]*>' 
  \ contains=cppTempParam,cppParenCall,cppTypeId0,cppTypeId,cppIdDecl,cppPackDecl,cppFuncId,cppSpecial,cppStatement,cppNumber,cppBoolean
  \ contained

syn match cppIdDeclJoin '>\(\_s\+const\)\?\(\(\(\*\|&\|&&\)\(\_s*const\_s\)\?\)\|\_s\)\s*\I'
  \ contains=cppTypeIdR,cppConst
  \ contained

syn match cppFuncId '\I\i*\(<\(\_[^<>]*\(\(\I\i*<\_[^<>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)\)*\_[^<>]*>\)\?\_s*('me=e-1 
  \ contains=cppTempContext contained

syn match cppMemberInit 
  \ ')\_s*:\(\_s*\I\i*\_s*\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\|{\(\_[^{}]*{\(\_[^{}]*{\_[^{}]*}\)*\_[^{}]*}\)*\_[^{}]*}\)\_s*[,{]\)*'
  \ contains=cppClassId,cppMemberId

syn match cppMemberId '\I\i*'
  \ contained

syn match cppClassId '\u\i*'
  \ contained

syn match cppStatement '\<enum\>' 
syn match cppStatement '\<class\>' 
syn match cppStatement '\<struct\>' 
syn match cppStatement '\<union\>' 
syn match cppStatement '\<namespace\>'
syn match cppStatement '\<typename\>'
syn match cppStatement '\<auto\>'
syn match cppStatement '\<using\>'
syn match cppStatement '\<typedef\>'
syn match cppStatement '\<template\>'
syn match cppStatement '\<enum\>' contained
syn match cppStatement '\<class\>' contained
syn match cppStatement '\<struct\>' contained
syn match cppStatement '\<union\>' contained
syn match cppStatement '\<namespace\>' contained
syn match cppStatement '\<typename\>' contained
syn match cppStatement '\<auto\>' contained
syn match cppStatement '\<using\>' contained
syn match cppStatement '\<typedef\>' contained
syn match cppStatement '\<template\>' contained

syn match cppStatement '\<public\>'
syn match cppStatement '\<private\>'
syn match cppStatement '\<protected\>'
syn match cppStatement '\<public\>' contained
syn match cppStatement '\<private\>' contained
syn match cppStatement '\<protected\>' contained

syn keyword cppBoolean true false contained

syn match cppSpecial '\<char\>'
syn match cppSpecial '\<char8_t\>'
syn match cppSpecial '\<char16_t\>'
syn match cppSpecial '\<char32_t\>'
syn match cppSpecial '\<wchar_t\>'
syn match cppSpecial '\<bool\>'
syn match cppSpecial '\<short\>'
syn match cppSpecial '\<int\>'
syn match cppSpecial '\<long\>'
syn match cppSpecial '\<signed\>'
syn match cppSpecial '\<unsigned\>'
syn match cppSpecial '\<float\>'
syn match cppSpecial '\<double\>'
syn match cppSpecial '\<void\>'

syn match cppSpecial '\<char\>' contained
syn match cppSpecial '\<char8_t\>' contained
syn match cppSpecial '\<char16_t\>' contained
syn match cppSpecial '\<char32_t\>' contained
syn match cppSpecial '\<wchar_t\>' contained
syn match cppSpecial '\<bool\>' contained
syn match cppSpecial '\<short\>' contained
syn match cppSpecial '\<int\>' contained
syn match cppSpecial '\<long\>' contained
syn match cppSpecial '\<signed\>' contained
syn match cppSpecial '\<unsigned\>' contained
syn match cppSpecial '\<float\>' contained
syn match cppSpecial '\<double\>' contained
syn match cppSpecial '\<void\>' contained

syn match cppPackDecl '\I\i*\s*\.\.\.\s*\I'
  \ contains=cppTypeIdL,cppPackIdR,cppStatement,cppSpecial

syn match cppIdDecl 
  \ '\I\i*\(\_s\+const\)\?\(\(\(\*\|&\|&&\)\(\s*const\_s\+\)\?\s*\I\)\|\(\_s\+\I\)\)'
  \ contains=cppTypeIdL,cppTypeIdR,cppStatement,cppConst

syn match cppIdDecl 
  \ '\I\i*\(\_s\+const\)\?\(\(\(\*\|&\|&&\)\(\s*const\_s\+\)\?\s*\I\)\|\(\_s\+\I\)\)'
  \ contains=cppTypeIdL,cppTypeIdR,cppStatement,cppConst
  \ contained

" syn match cppExpr '\I\i*\s\+[\*&]\s\+\I\i*'
"   \ contains=cppId,cppTypeId

syn match cppTempParam '\(typename\|class\)\_s\+\I\i*'
  \ contains=cppTypeId0,cppStatement

syn match cppTempParam '\(typename\|class\)\_s*\.\.\.\_s*\I\i*'
  \ contains=cppTypeId0,cppStatement

syn match cppTempParam '\(typename\|class\)\_s\+\I\i*'
  \ contains=cppTypeId0,cppStatement
  \ contained

syn match cppTempParam '\(typename\|class\)\_s*\.\.\.\_s*\I\i*'
  \ contains=cppTypeId0,cppStatement
  \ contained

syn match cppTypeDecl
  \ '\(using\|typedef\|namespace\|class\|struct\|union\|enum\)\_[^{;]*[{;]'
  \ contains=cppTypeId,cppParenCall,cppTypeId0,cppStatement,cppBoolean,cppNumber

syn match cppTypeDecl
  \ '\(using\|typedef\|namespace\|class\|struct\|union\|enum\)\_[^{;]*[{;]'
  \ contains=cppTypeId,cppParenCall,cppTypeId0,cppStatement,cppBoolean,cppNumber
  \ contained

syn match cppUsingDecl
  \ 'using\_s\+\I\i*\_s*=\_[^;]*;'
  \ contains=cppTypeId,cppParenCall,cppTypeId0,cppStatement,cppBoolean,cppNumber

syn match cppTempDecl
  \ 'template\_s*<'
  \ contains=cppTempDecl,cppTempDeclContext,cppStatement

syn match cppTempDecl
  \ 'template\_s*<'
  \ contains=cppTempDecl,cppTempDeclContext,cppStatement
  \ contained

syn match cppTypenameContext
  \ 'typename\_s\+\(\_s*::\|\I\i*\|(\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\|<\(\_[^<>]*\(\I\i*<\_[^<>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)*\_[^<>]*>\)*'
  \ contains=cppTypeId0,cppTypeId,cppParenCall,cppStatement

syn match cppConst '\<const\>'
syn match cppConst '\<const\>' contained

syn match cppStatement '\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<'me=e-1
syn match cppStatement '\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<'me=e-1 
  \ contained

syn match cppMacro '\<\(\u\|_\)\{5,}\>'

syn region cDefine start="^\s*\zs\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend
syn region cPreProc start="^\s*\zs\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend

hi! def link cppSpecial Special
hi! def link cppStatement Statement
hi! def link cppConst Statement
hi! def link cppModifier Statement
hi! def link cppOperator Statement

hi! def link cppType Type
hi! def link cppFuncId Function
hi! def link cppFuncDecl Function
hi! def link cppTypeId Type
hi! def link cppTypeIdL Type
hi! def link cppTypeIdR Identifier
hi! def link cppPackIdR Identifier
hi! def link cppId Identifier
hi! def link cppMemberId Identifier
hi! def link cppTypeId0 Type
hi! def link cppClassId Type

hi! def link cppMacro PreProc
