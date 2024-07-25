module ArmstrongNumbers

import Data.Nat

export
isArmstrongNumber : Nat -> Bool
isArmstrongNumber number = number == powerSum (listDigits (cast number))
  where listDigits : Integer -> List Nat
        listDigits n = if n < 10 then [cast n] else (cast (mod n 10)) :: (listDigits (div n 10))
        powerSum : List Nat -> Nat
        powerSum digits = sum $ map (\digit => power digit len) digits
          where len = length digits
