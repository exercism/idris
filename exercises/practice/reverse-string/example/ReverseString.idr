module ReverseString

export
rev : String -> String
rev = pack . reverseList [] . unpack
where reverseList : List Char -> List Char -> List Char
      reverseList suffix [] = suffix
      reverseList suffix (x :: xs) = reverseList (x :: suffix) xs
