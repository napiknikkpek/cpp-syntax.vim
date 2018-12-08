runtime! expected.vim

let s:suite = themis#suite('Simple test')

let s:assert = themis#helper('assert')

let files = systemlist("find . -name '*.cpp' -printf '%f\n'")
call map(files, 'v:val[:-5]')

fu! Check_file(file)
  call s:assert.equals(
    \ Highlighting_of('data/' . a:file . '.cpp'), readfile('data/' . a:file . '.expected'))
endfu

for file in files
  let s:suite[file] = function('Check_file', [file])
endfor
