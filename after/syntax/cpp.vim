syn clear cType
syn clear cppStructure
syn clear cStructure
syn clear cStatement
syn clear cppStatement
syn clear cErrInBracket

" except `using`, `class`, `struct`, `typename`
syn keyword cpp_keyword alignas alignof and and_eq asm atomic_cancel atomic_commit atomic_noexcept auto bitand bitor bool break case catch char char8_t char16_t char32_t compl concept const consteval constexpr const_cast continue co_await co_return co_yield decltype default delete do double dynamic_cast else enum explicit export extern false float for friend goto if inline int long mutable namespace new noexcept not not_eq nullptr operator or or_eq private protected public reflexpr register reinterpret_cast requires return short signed sizeof static static_assert static_cast switch synchronized template this thread_local throw true try typedef typeid union unsigned virtual void volatile wchar_t while xor xor_eq

syn keyword cpp_keyword using class struct typename contained

syn keyword cpp_fundamental bool char char8_t char16_t char32_t double float int long short signed unsigned void wchar_t 

syn keyword cpp_constant false nullptr true

syn match cpp_type '\I\i*' contained
syn match cpp_identifier '\<\I\i*'

syn match cpp_function '\<\I\i*('me=e-1

syn match cpp_function '\I\i*<'me=e-1
syn match cpp_function '\I\i*<'me=e-1 contained

syn match cpp_type '\I\i*::'me=e-2

syn match cpp_type '\I\i*\s\+\I'me=e-1
syn match cpp_type '\I\i*\s*{'me=e-1
syn match cpp_type '\I\i*\*'me=e-1
syn match cpp_type '\I\i*&'me=e-1
syn match cpp_type '\I\i*\s\+\*\I'me=e-2
syn match cpp_type '\I\i*\s\+&\I'me=e-2

syn match cpp_macro '\<\(\u\|\d\|_\)\{5,}\>'

syn match cpp_type 'using\s\+\I\i*' contains=cpp_keyword
syn match cpp_type 'class\s\+\I\i*' contains=cpp_keyword
syn match cpp_type 'struct\s\+\I\i*' contains=cpp_keyword

syn match cpp_type '\<\I\i*_t\>'
syn match cpp_type '\<\I\i*_type\>'

syn match cpp_typename_ctx '\<typename\>' contains=cpp_keyword
syn match cpp_typename_ctx '\<typename\s*...\s*\I\i*\>' contains=cpp_keyword,cpp_type
syn match cpp_typename_ctx 'typename \I\i*\(::\I\i*\)*' contains=cpp_keyword,cpp_type,cpp_function

syn match cPreProc '#\s*\I\i*'ms=s+1 contained

syn region cppRawString	matchgroup=cppRawStringDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell
syn region cppRawString	matchgroup=cppRawStringDelimiter start=+\%(u8\|[uLU]\)\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=@Spell

hi! def link cpp_keyword Statement
hi! def link cpp_fundamental Special
hi! def link cpp_function Function
hi! def link cpp_type Type
hi! def link cpp_identifier Identifier
hi! def link cpp_constant Constant
hi! def link cpp_macro PreProc
