module Leap

export 
isLeap : Integer -> Bool
isLeap year =
  (divBy 4 && not (divBy 100)) || divBy 400
  where divBy : Integer -> Bool
        divBy n = (year `mod` n) == 0
