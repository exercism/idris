module LargestSeriesProduct

import Data.Nat

public export
data Error = StringContainsNonDigit | SpanExceedsStringLength

export
largestProduct : String -> Nat -> Either Error Int
largestProduct digits span = if containsNonDigit (unpack digits) then Left StringContainsNonDigit
                             else if span > length digits then Left SpanExceedsStringLength
                             else if span == 0 then Right 1
                             else Right (largest $ unpack digits)
  where containsNonDigit : List Char -> Bool
        containsNonDigit [] = False
        containsNonDigit (first :: rest) = if isDigit first then containsNonDigit rest
                                           else True
        product : Int -> Nat -> List Char -> Int
        product multiplier 0 _ = multiplier
        product multiplier remaining [] = 0
        product multiplier remaining (first :: rest) = product (multiplier * ((ord first) - 48)) (pred remaining) rest
        max : Int -> Int -> Int
        max first second = if first >= second then first else second
        largest : List Char -> Int
        largest [] = 0
        largest (first :: rest) = max (product 1 span (first :: rest)) (largest rest)
