setlocal path=.,,src/*/java
setlocal include=^\s*import
let &l:define='^public\ \(abstract\ \)\?\(class\|interface\)'

nnoremap <buffer> <Space>m :!ctags -R --languages=Java src<CR>
