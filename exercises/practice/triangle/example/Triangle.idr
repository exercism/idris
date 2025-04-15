module Triangle

import Data.Vect

isTriangle : Vect 3 Integer -> Bool
isTriangle (first :: second :: third :: nil) = (first > 0) &&
                                               (second > 0) &&
                                               (third > 0) &&
                                               (first <= second + third) &&
                                               (second <= first + third) &&
                                               (third <= first + second)

-- number of distinct values
cardinality : Vect 3 Integer -> Integer
cardinality (first :: second :: third :: nil) =
    if (first == second) && (first == third) then 1
    else if (first == second) || (first == third) || (second == third) then 2
    else 3

export
isEquilateral : Vect 3 Integer -> Bool
isEquilateral sides = (isTriangle sides) && (cardinality sides == 1)

export
isIsosceles : Vect 3 Integer -> Bool
isIsosceles sides = (isTriangle sides) && (cardinality sides <= 2)

export
isScalene : Vect 3 Integer -> Bool
isScalene sides = (isTriangle sides) && (cardinality sides == 3)
