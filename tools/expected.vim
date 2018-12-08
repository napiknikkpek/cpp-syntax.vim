let s:symbol_table = {
\   ' ': ' ',
\   'PreProc': 'm',
\   'Constant': 'o',
\   'String': 's',
\   'Statement': 'a',
\   'Type': 't',
\   'Special': 'z',
\   'Identifier': 'x',
\   'Function': 'f',
\ }

fu! s:syntax_at(lnum, col)
  if getline(a:lnum)[a:col - 1] =~ '\s'
    return '.'
  endif
  let name = synIDattr(synIDtrans(synID(a:lnum, a:col, 1)), 'name')
  return get(s:symbol_table, name, '.')
endfu

fu! Highlighting_of(file)
  new
  try
    setfiletype cpp
    silent 0read `=a:file`
    let xs = []
    for l in range(1, line('$') - 1)
      call add(
      \   xs,
      \   join(map(range(1, col([l, "$"]) - 1), 's:syntax_at(l, v:val)'), '')
      \ )
    endfor
    return xs
  finally
    close!
  endtry
endfu

fu! Expect_file(file)
  let xs = Highlighting_of(a:file)
  call writefile(xs, a:file . '.generated')
endfu
