setlocal path=.,,src/*/java
setlocal include=^\s*import
let &l:define='^public\ \(abstract\ \)\?\(class\|interface\)'
