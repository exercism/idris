module Darts

export
score : Double -> Double -> Int
score x y = points (x * x + y * y)
  where points : Double -> Int
        points s = if s > 100 then 0
                   else if s > 25 then 1
                   else if s > 1 then 5
                   else 10
