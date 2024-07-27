module AllYourBase

import Data.List

public export
data Error = InvalidBase | InvalidDigit

convertTo : Int -> Int -> List Int
convertTo outputBase = reverse . loop
  where loop : Int -> List Int
        loop value = if value < outputBase then [value]
                     else (mod value outputBase) :: (loop (div value outputBase))

convertFrom : Int -> List Int -> Int
convertFrom inputBase digits = loop 0 digits
  where loop : Int -> List Int -> Int
        loop acc [] = acc
        loop acc (x :: xs) = loop (acc * inputBase + x) xs

export
rebase : Int -> List Int -> Int -> Either Error (List Int)
rebase inputBase digits outputBase = if inputBase < 2 || outputBase < 2 then Left InvalidBase
                                     else if find (\digit => digit < 0 || digit >= inputBase) digits /= Nothing then Left InvalidDigit
                                     else Right $ convertTo outputBase $ convertFrom inputBase digits
