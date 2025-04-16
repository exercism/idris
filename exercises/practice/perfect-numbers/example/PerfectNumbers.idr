module PerfectNumbers

public export
data Category = Perfect | Abundant | Deficient

export
classify : Int -> Maybe Category
classify number = if number <= 0 then Nothing else Just $ compare (factorSum number 2 1 1) (number + number)
  where compare : Int -> Int -> Category
        compare sum reference = if sum == reference then Perfect
                                else if sum > reference then Abundant
                                else Deficient
        factorSum : Int -> Int -> Int -> Int -> Int
        factorSum number p series multiplier = if number `mod` p == 0 then factorSum (number `div` p) p (p * series + 1) multiplier
                                               else if number == 1 then series * multiplier
                                               else factorSum number (p + 1) 1 (series * multiplier)
