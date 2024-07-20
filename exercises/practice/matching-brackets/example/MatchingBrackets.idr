module MatchingBrackets

export
isPaired : String -> Bool
isPaired = loop [] . filter isBracket . unpack
  where isBracket : Char -> Bool
        isBracket ch = ch == '[' || ch == ']' || ch == '{' || ch == '}' || ch == '(' || ch == ')'
        loop : List Char -> List Char -> Bool
        loop []        []        = True
        loop _         []        = False
        loop []        (y :: ys) = if y == '[' || y == '{' || y == '(' then loop (y :: []) ys
                                   else False
        loop (x :: xs) (y :: ys) = if y == '[' || y == '{' || y == '(' then loop (y :: x :: xs) ys
                                   else if (x == '[' && y == ']') || (x == '{' && y == '}') || (x == '(' && y == ')') then loop xs ys
                                   else False
