module SquareRoot

export
squareRoot : Int -> Int
squareRoot radicand = loop 0
  where loop : Int-> Int
        loop n = if radicand <= n * n
                    then n
                    else loop (n + 1)
