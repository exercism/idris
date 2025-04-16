module SumOfMultiples

export
sum : List Int -> Int -> Int
sum factors limit = if limit == 0 then 0 else loop (limit - 1) 0
  where isMultiple : Int -> List Int -> Bool
        isMultiple _ [] = False
        isMultiple n (x :: xs) = (x /= 0 && (n `mod` x) == 0) || (isMultiple n xs)
        loop : Int -> Int -> Int
        loop 0 acc = acc
        loop n acc = loop (n - 1) $ if isMultiple n factors
                                    then n + acc
                                    else acc
