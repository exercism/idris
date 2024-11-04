module IsbnVerifier

export
isValid : String -> Bool
isValid = loop 10 0 0 . filter (\x => x /= '-') . unpack
  where loop : Int -> Int -> Int -> List Char -> Bool
        loop remaining unweighted weighted [] = (remaining == 0) && (mod weighted 11 == 0)
        loop remaining unweighted weighted (x :: xs) = if (x >= '0') && (x <= '9') then process (cast (ord x) - 48)
                                                       else remaining == 1 && x == 'X' && process 10
          where process : Int -> Bool
                process value = loop (remaining - 1) (unweighted + value) (weighted + unweighted + value) xs
