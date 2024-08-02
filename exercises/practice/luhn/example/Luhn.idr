module Luhn

digitValue : Integer -> Integer -> Integer
digitValue count digit = if mod count 2 == 0 then digit
                         else if digit < 5 then 2 * digit
                         else 2 * digit - 9

export
isValid : String -> Bool
isValid = loop 0 0 . map (\ch => (cast {to = Integer} $ ord ch) - 48) . filter (\ch => ch /= ' ') . unpack . reverse
  where loop : Integer -> Integer -> List Integer -> Bool
        loop count acc [] = (count >= 2) && (mod acc 10 == 0)
        loop count acc (x :: xs) = if (x < 0) || (x > 9) then False
                                   else loop (count + 1) (acc + (digitValue count x)) xs
