module Main

import System
import Tester
import Tester.Runner

import PythagoreanTriplet
import Data.Vect

tests : List Test
tests =
  [ test "triplets whose sum is 12"      (assertEq (tripletsWithSum 12) [[3, 4, 5]])
  , test "triplets whose sum is 108"     (assertEq (tripletsWithSum 108) [[27, 36, 45]])
  , test "triplets whose sum is 1000"    (assertEq (tripletsWithSum 1000) [[200, 375, 425]])
  , test "no matching triplets for 1001" (assertEq (tripletsWithSum 1001) [])
  , test "returns all matching triplets" (assertEq (tripletsWithSum 90) [[9, 40, 41], [15, 36, 39]])
  , test "several matching triplets"     (assertEq (tripletsWithSum 840) [[40, 399, 401], [56, 390, 394], [105, 360, 375], [120, 350, 370], [140, 336, 364], [168, 315, 357], [210, 280, 350], [240, 252, 348]])
  , test "triplets for large number"     (assertEq (tripletsWithSum 30000) [[1200, 14375, 14425], [1875, 14000, 14125], [5000, 12000, 13000], [6000, 11250, 12750], [7500, 10000, 12500]])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
