module RunLengthEncoding

import Data.String

export
encode : String -> String
encode = loop 0 '?' . unpack
  where repeats : Int -> Char -> String
        repeats 0 letter = ""
        repeats 1 letter = singleton letter
        repeats n letter = (show n) ++ (singleton letter)
        loop : Int -> Char -> List Char -> String
        loop n letter [] = repeats n letter
        loop n letter (first :: rest) = if first == letter then loop (1 + n) letter rest
                                        else (repeats n letter) ++ (loop 1 first rest)

export
decode : String -> String
decode = process 0 . unpack
  where repeat : Int -> Char -> String
        repeat 0 letter = ""
        repeat n letter = (singleton letter) ++ (repeat (n - 1) letter)
        process : Int -> List Char -> String
        process n [] = ""
        process n (first :: rest) = if isDigit first then process (10 * n + (ord first) - 48) rest
                                    else if n == 0 then (singleton first) ++ (process 0 rest)
                                    else (repeat n first) ++ (process 0 rest)
