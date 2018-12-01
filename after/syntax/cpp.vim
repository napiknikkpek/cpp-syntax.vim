
syn clear cType
syn clear cStructure
" typedef
syn clear cStorageClass
" const
syn clear cBlock
syn clear cParen
syn clear cParenError

syn clear cppAccess
syn clear cppType
syn clear cppStructure

syn match cppNumber		display "\<0b[01]\('\=[01]\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  \ contained
syn match cppNumber		display "\<[1-9]\('\=\d\+\)*\(u\=l\{0,2}\|ll\=u\)\>" 
  \ contains=cFloat contained
syn match cppNumber		display "\<0x\x\('\=\x\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  \ contained

syn keyword cppStatement static register auto volatile extern inline restrict alignas noreturn thread_local return decltype constexpr
syn keyword cppStatement static register auto volatile extern inline restrict alignas noreturn thread_local return decltype constexpr contained

syn keyword cppSpecial char char8_t char16_t char32_t wchar_t bool short int long signed unsigned float double void
syn keyword cppSpecial char char8_t char16_t char32_t wchar_t bool short int long signed unsigned float double void contained

syn match cppId '\I\i*'
syn match cppId '\I\i*' contained
syn match cppId '\I\i*.'me=e-1 contained
syn match cppId '\I\i*->'me=e-2 contained
syn match cppId '.\I\i*'ms=s+1 contained
syn match cppId '->\I\i*'ms=s+2 contained
syn match cppInTempId '\I\i*' contained

syn match cppTypeId '\I\i*<'he=e-1 contains=cppTempContext contained
syn match cppTypeId '\I\i*::'me=e-2 contained

syn match cppTypeId '\I\i*<'he=e-1 contains=cppTempContext
syn match cppTypeId '\I\i*::'me=e-2
syn match cppFuncId '\I\i*\(<\(\_[^>]*\(\I\i*<\_[^>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)*\_[^>]*>\)\?\_s*('me=e-1 contains=cppTempContext

syn match cppParenContext /(\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)/
  \ contains=cppTempContext,cppId,cppTypeId,cppFuncId,cppSpecial,cppStatement,cppNumber
  \ contained

syn match cppTempContext /<\(\_[^>]*\(\I\i*<\_[^>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)*\_[^>]*>/ 
  \ contains=cppParenContext,cppInTempId,cppTypeId,cppFuncId,cppSpecial,cppStatement,cppNumber
  \ contained

syn match cppIdDeclType '\I\i*' contained
syn match cppIdDeclName '\s\I\i*'ms=s+1 contained

syn match cppFuncId '\I\i*\(<\(\_[^>]*\(\I\i*<\_[^>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)*\_[^>]*>\)\?\_s*('me=e-1 contains=cppTempContext contained

syn match cppIdDecl
  \ '\I\i*\(<\(\_[^>]*\(\I\i*<\_[^>]*>\)\|\((\(\_[^()]*(\(\_[^()]*(\_[^()]*)\)*\_[^()]*)\)*\_[^()]*)\)\)*\_[^>]*>\)\?\_s\+\I\i*'
  \ contains=cppTempContext,cppIdDeclType,cppIdDeclName,cppFuncId,cppSpecial,cppStatement,cppNumber

" Type declaration
syn match cppTypeIdDecl /\I\i*/ contained

syn match cppStatement /enum/ 
syn match cppStatement /class/ 
syn match cppStatement /struct/ 
syn match cppStatement /union/ 
syn match cppStatement /namespace/
syn match cppStatement /enum/ contained
syn match cppStatement /class/ contained
syn match cppStatement /struct/ contained
syn match cppStatement /union/ contained
syn match cppStatement /namespace/ contained

syn match cppStatement /public/
syn match cppStatement /private/
syn match cppStatement /protected/
syn match cppStatement /public/ contained
syn match cppStatement /private/ contained
syn match cppStatement /protected/ contained

syn match cppTypeDecl
  \ /\(namespace\|class\|struct\|union\|enum\)\_.\{-}{/
  \ contains=cppTypeIdDecl,cppStatement


hi! def link cppSpecial Special
hi! def link cppStatement Statement
hi! def link cppType Type
hi! def link cppFuncId Function
hi! def link cppTypeId Type
hi! def link cppTypeIdDecl Type
hi! def link cppId Identifier

hi! def link cppIdDeclType Type
hi! def link cppIdDeclName Identifier

hi! def link cppInTempId Type
