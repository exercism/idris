module Accumulate

export
accumulate : (Int -> Int) -> List Int -> List Int
accumulate f [] = []
accumulate f (x::xs) = f x :: accumulate f xs
