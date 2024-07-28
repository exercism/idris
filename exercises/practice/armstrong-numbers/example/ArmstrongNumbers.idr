module ArmstrongNumbers

import Data.Nat

export
isArmstrongNumber : Integer -> Bool
isArmstrongNumber number = number == powerSum (listDigits number)
  where listDigits : Integer -> List Integer
        listDigits n = if n < 10 then [n] else (mod n 10) :: listDigits (div n 10)
        powerSum : List Integer -> Integer
        powerSum digits = cast $ sum $ map (\digit => power (cast digit) len) digits
          where len = length digits
