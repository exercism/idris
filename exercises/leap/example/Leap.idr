module Leap

export
isLeap : Int -> Bool
isLeap year = (divBy 4 && not (divBy 100)) || divBy 400
  where
    divBy : Int -> Bool
    divBy n = (year `mod` n) == 0
