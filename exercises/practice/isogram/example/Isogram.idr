module Isogram

import Data.Bits

export
isIsogram : String -> Bool
isIsogram phrase = loop 0 $ filter isAlpha $ unpack phrase
  where loop : Integer -> List Char -> Bool
        loop _ [] = True
        loop seen (x :: xs) = if updated == seen then False
                              else loop updated xs
          where updated = setBit seen $ cast $ (ord x .|. 32) - 97
