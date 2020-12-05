syn clear cType
syn clear cppStructure
syn clear cStructure
syn clear cStatement
syn clear cppStatement
syn clear cErrInBracket
syn clear cStorageClass

" except `const`, `using`, `class`, `struct`, `typename`
syn keyword cpp_keyword alignas alignof and and_eq asm atomic_cancel atomic_commit atomic_noexcept auto bitand bitor bool break case catch char char8_t char16_t char32_t compl concept consteval constexpr const_cast continue co_await co_return co_yield decltype default delete do double dynamic_cast else enum explicit export extern false float for friend goto if inline int long mutable new noexcept not not_eq nullptr operator or or_eq private protected public reflexpr register reinterpret_cast requires return short signed sizeof static static_assert static_cast switch synchronized template this thread_local throw true try typedef typeid union unsigned virtual void volatile wchar_t while xor xor_eq

syn keyword cpp_keyword override final

syn keyword cpp_keyword const using class struct typename namespace contained

syn keyword cpp_fundamental bool char char8_t char16_t char32_t double float int long short signed unsigned void wchar_t 

syn keyword cpp_constant false nullptr true

syn match cpp_type '\<\I\i*\>' contained
syn match cpp_identifier '\<\I\i*\>'

syn match cpp_function '\<\I\i*\ze('

syn match cpp_type '\<\I\i*\ze<'
syn match cpp_function '\<\I\i*\ze<\(\<\I\i*<\(([^()]*)\|[^<>]\)*>\|([^()]*)\|[^<>]\)*>('

syn match cpp_type '\I\i*\ze::'
syn match cpp_type '\<\I\i*\s*\ze{'

" syn match cpp_test '\s\+\zs\I\i*\ze{' contained contains=cpp_identifier
" syn match cpp_decl '\I\i*\s\+\I' contains=cpp_type,cpp_test

syn match cpp_decl '\I\i*\s\+\ze\I' contains=cpp_type
syn match cpp_decl '\<const\>' contains=cpp_keyword
syn match cpp_decl '\<const\s\+\I\i*\>' contains=cpp_keyword,cpp_type,cpp_fundamental
syn match cpp_decl '\<const\s\+\I\i*\s*\*\s*\(const\>\)\?' contains=cpp_keyword,cpp_type,cpp_fundamental
syn match cpp_decl '\<const\s\+\I\i*\s*&\{1,2\}' contains=cpp_keyword,cpp_type,cpp_fundamental
syn match cpp_decl '\<\I\i*\s\+const\s*\*\s*\(const\>\)\?' contains=cpp_keyword,cpp_type,cpp_fundamental
syn match cpp_decl '\<\I\i*\s\+const\s*&' contains=cpp_keyword,cpp_type,cpp_fundamental
syn match cpp_decl '\<\I\i*\s*\*\s*const\>' contains=cpp_keyword,cpp_type,cpp_fundamental
syn match cpp_decl '\<\I\i*\*' contains=cpp_keyword,cpp_type,cpp_fundamental
syn match cpp_decl '\<\I\i*\s*\*\ze\I' contains=cpp_keyword,cpp_type,cpp_fundamental
syn match cpp_decl '\<\I\i*&\{1,2\}' contains=cpp_keyword,cpp_type,cpp_fundamental
syn match cpp_decl '\<\I\i*\s*&\{1,2\}\ze\I' contains=cpp_keyword,cpp_type,cpp_fundamental

syn match cpp_macro '\<\u\(\u\|\d\|_\)\{3,}\>'

syn region cpp_class_ctx start='\<class\>' end='\ze{' end=';' contains=ALLBUT,cpp_identifier
syn region cpp_class_ctx start='\<struct\>' end='\ze{' end=';' contains=ALLBUT,cpp_identifier

syn region cpp_using_ctx start='\<using\>' end=';' contains=ALLBUT,cpp_identifier,cpp_namespace_ctx

syn region cpp_namespace_ctx start='\<namespace\>' end='\ze{' end=';' contains=cpp_type,cpp_keyword

syn region cpp_typename_ctx start='\<typename\>' end=',' end='>' end=';' contains=ALLBUT,cpp_identifier

syn region cpp_template_ctx start='\<\I\i*<' end='>' contains=ALLBUT,cpp_identifier,cCppParen,@cParenGroup

" syn match cpp_identifier '\<\I\i*<\(\<\I\i*<\(([^()]*)\|[^<>]\)*>\|([^()]*)\|[^<>]\)*>\s\+\I\i*\ze{' contains=cpp_template_ctx

syn match cPreProc '#\s*\I\i*' contained
syn match cPreProc '#\s*pragma\s\+once' contained

syn region cppRawString	matchgroup=cppRawStringDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell fold
syn region cppRawString	matchgroup=cppRawStringDelimiter start=+\%(u8\|[uLU]\)\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=@Spell

hi! def link cpp_keyword Statement
hi! def link cpp_fundamental Special
hi! def link cpp_function Function
hi! def link cpp_type Type
hi! def link cpp_identifier Identifier
hi! def link cpp_constant Constant
hi! def link cpp_macro PreProc
