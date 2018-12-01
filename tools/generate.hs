
call n f x = iterate f x !! n

genParen :: Int -> String
genParen n = call n (\x -> "(\\(\\_[^()]*" ++ x ++ "\\)*\\_[^()]*)") "(\\_[^()]*)"

genTemp :: Int -> String
genTemp n = "<\\(\\_[^>]*\\(\\I\\i*<\\_[^>]*>\\)\\|\\("++ paren ++ "\\)\\)*\\_[^>]*>"
  where paren = genParen n
