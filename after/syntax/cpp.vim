
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

syn match cppNumber display "\<0b[01]\('\=[01]\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  \ contained
syn match cppNumber display "\<[1-9]\('\=\d\+\)*\(u\=l\{0,2}\|ll\=u\)\>" 
  \ contains=cFloat contained
syn match cppNumber display "\<0x\x\('\=\x\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  \ contained

syn keyword cppStatement static register volatile extern inline restrict alignas noreturn thread_local return decltype constexpr template mutable
syn keyword cppStatement static register volatile extern inline restrict alignas noreturn thread_local return decltype constexpr template mutable contained

syn keyword cppSpecial char char8_t char16_t char32_t wchar_t bool short int long signed unsigned float double void
syn keyword cppSpecial char char8_t char16_t char32_t wchar_t bool short int long signed unsigned float double void contained

syn match cppId '\I\i*'
syn match cppId '\I\i*' contained
syn match cppId '\l\i*{'me=e-1
syn match cppId '\l\i*{'me=e-1 contained
syn match cppId '\I\i*.'me=e-1 contained
syn match cppId '\I\i*->'me=e-2 contained
syn match cppId '.\I\i*'ms=s+1 contained
syn match cppId '->\I\i*'ms=s+2 contained
syn match cppInTempId '\I\i*' contained

syn match cppTypeId '\u\i*{'me=e-1
syn match cppTypeId '\u\i*{'me=e-1 contained
syn match cppTypeId '\I\i*<'he=e-1 contains=cppTempContext
syn match cppTypeId '\I\i*::'me=e-2
syn match cppTypeId '\I\i*<'he=e-1 contains=cppTempContext contained
syn match cppTypeId '\I\i*::'me=e-2 contained

syn match cppTypeIdL '\I\i*' contained

syn match cppTypeIdX '\I\i*\([\*&]\|const\|\_s\)\+\I'me=e-1 
  \ contains=cppTempContext,cppTypeIdL,cppStatement
syn match cppTypeIdX '\I\i*\([\*&]\|const\|\_s\)\+\I'me=e-1 
  \ contains=cppTempContext,cppTypeIdL,cppStatement contained

syn match cppFuncId '\I\i*\(<\(\_[^>]*\(\i\i*<\_[^>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)*\_[^>]*>\)\?\_s*('me=e-1 
  \ contains=cppTempContext

syn match cppParenContext '(\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)'
  \ contains=cppTempContext,cppId,cppTypeId,cppFuncId,cppSpecial,cppStatement,cppNumber,cppBoolean
  \ contained

syn match cppTempContext '<\(\_[^>]*\(\I\i*<\_[^>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)*\_[^>]*>' 
  \ contains=cppParenContext,cppInTempId,cppTypeId,cppFuncId,cppSpecial,cppStatement,cppNumber,cppBoolean
  \ contained

syn match cppFuncId '\I\i*\(<\(\_[^>]*\(\I\i*<\_[^>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)*\_[^>]*>\)\?\_s*('me=e-1 
  \ contains=cppTempContext contained

syn match cppStatement '\<enum\>' 
syn match cppStatement '\<class\>' 
syn match cppStatement '\<struct\>' 
syn match cppStatement '\<union\>' 
syn match cppStatement '\<namespace\>'
syn match cppStatement '\<const\>'
syn match cppStatement '\<typename\>'
syn match cppStatement '\<auto\>'
syn match cppStatement '\<using\>'
syn match cppStatement '\<typedef\>'
syn match cppStatement '\<enum\>' contained
syn match cppStatement '\<class\>' contained
syn match cppStatement '\<struct\>' contained
syn match cppStatement '\<union\>' contained
syn match cppStatement '\<namespace\>' contained
syn match cppStatement '\<const\>' contained
syn match cppStatement '\<typename\>' contained
syn match cppStatement '\<auto\>' contained
syn match cppStatement '\<using\>' contained
syn match cppStatement '\<typedef\>' contained

syn match cppStatement '\<public\>'
syn match cppStatement '\<private\>'
syn match cppStatement '\<protected\>'
syn match cppStatement '\<public\>' contained
syn match cppStatement '\<private\>' contained
syn match cppStatement '\<protected\>' contained

syn match cppTypeDecl
  \ '\(using\|typedef\|namespace\|class\|struct\|union\|enum\)\_[^{;]*[{;]'
  \ contains=cppTempContext,cppParenContext,cppInTempId,cppStatement,cppBoolean,cppNumber

syn match cppUsingDecl
  \ 'using\_s\+\I\i*\_s*=\_[^;]*;'
  \ contains=cppTempContext,cppParenContext,cppInTempId,cppStatement,cppBoolean,cppNumber

syn match cppTempParam 'typename\(\_s\|\.\.\.\)\+\I\i*'
  \ contains=cppInTempId,cppStatement,cppSpecial

syn match cppStatement '\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<'me=e-1
syn match cppStatement '\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<'me=e-1 
  \ contained

syn keyword cppBoolean true false contained

syn match cppMacro '\<\(\u\|_\)\{5,}\>'

syn region cDefine start="^\s*\zs\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend
syn region cPreProc start="^\s*\zs\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend

hi! def link cppSpecial Special
hi! def link cppStatement Statement
hi! def link cppModifier Statement
hi! def link cppOperator Statement

hi! def link cppType Type
hi! def link cppFuncId Function
hi! def link cppTypeId Type
hi! def link cppTypeIdL Type
hi! def link cppTypeIdDecl Type
hi! def link cppId Identifier

hi! def link cppIdDeclType Type
hi! def link cppIdDeclName Identifier

hi! def link cppInTempId Type

hi! def link cppMacro PreProc
