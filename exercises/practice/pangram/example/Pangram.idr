module Pangram

import Data.Bits
import Data.String

export
isPangram : String -> Bool
isPangram sentence = 0x3ffffff == (coverage 0 $ filter isAlpha $ unpack $ toUpper sentence)
  where coverage : Integer -> List Char -> Integer
        coverage seen [] = seen
        coverage seen (x :: xs) = coverage (setBit seen $ cast $ ord x - 65) xs
