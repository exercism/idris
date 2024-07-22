module PythagoreanTriplet

import Data.Vect

{- For every Pythagorean triplet with total a + b + c = n,
 -   a² + b² = c²
 -   <=> a² + b² = (n - a - b)², substituting c
 -   <=> 0 = n² - 2*n*a - 2*n*b + 2*a*b
 -   <=> (2*n - 2*a) b = (n² - 2*n*a)
 -}

export
tripletsWithSum : Int -> List (Vect 3 Int)
tripletsWithSum n = if n < 2 then []
                    else recurse 1
  where recurse : Int -> List (Vect 3 Int)
        recurse a = if b <= a then []
                    else if mod numerator denominator /= 0 then recurse (a + 1)
                    else [a, b, (n - a - b)] :: recurse (a + 1)
          where numerator = n * (n - 2 * a)
                denominator = 2 * (n - a)
                b = div numerator denominator
