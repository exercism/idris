module PrimeFactors

export
factors : Int -> List Int
factors value = if value == 1 then []
                else loop 2 value
  where loop : Int -> Int -> List Int
        loop p n = if n < p * p then n :: []
                   else if mod n p == 0 then p :: loop p (div n p)
                   else loop (p + 1) n
