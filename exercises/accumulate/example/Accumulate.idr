module Accumulate

export
accumulate : (a -> b) -> List a -> List b
accumulate f [] = []
accumulate f (x::xs) = f x :: accumulate f xs
