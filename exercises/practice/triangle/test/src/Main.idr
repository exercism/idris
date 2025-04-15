module Main

import System
import Tester
import Tester.Runner

import Triangle
import Data.Vect

tests : List Test
tests =
  [ test "all sides are equal"                      (assert $       isEquilateral [2, 2, 2])
  , test "any side is unequal"                      (assert $ not $ isEquilateral [2, 3, 2])
  , test "no sides are equal"                       (assert $ not $ isEquilateral [5, 4, 6])
  , test "all zero sides is not a triangle"         (assert $ not $ isEquilateral [0, 0, 0])
  , test "last two sides are equal"                 (assert $       isIsosceles [3, 4, 4])
  , test "first two sides are equal"                (assert $       isIsosceles [4, 4, 3])
  , test "first and last sides are equal"           (assert $       isIsosceles [4, 3, 4])
  , test "equilateral triangles are also isosceles" (assert $       isIsosceles [4, 4, 4])
  , test "no sides are equal"                       (assert $ not $ isIsosceles [2, 3, 4])
  , test "first triangle inequality violation"      (assert $ not $ isIsosceles [1, 1, 3])
  , test "second triangle inequality violation"     (assert $ not $ isIsosceles [1, 3, 1])
  , test "third triangle inequality violation"      (assert $ not $ isIsosceles [3, 1, 1])
  , test "no sides are equal"                       (assert $       isScalene [5, 4, 6])
  , test "all sides are equal"                      (assert $ not $ isScalene [4, 4, 4])
  , test "first and second sides are equal"         (assert $ not $ isScalene [4, 4, 3])
  , test "first and third sides are equal"          (assert $ not $ isScalene [3, 4, 3])
  , test "second and third sides are equal"         (assert $ not $ isScalene [4, 3, 3])
  , test "may not violate triangle inequality"      (assert $ not $ isScalene [7, 3, 2])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
