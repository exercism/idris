module Main

import System
import Tester
import Tester.Runner

import DifferenceOfSquares

tests : List Test
tests =
  [ test "square of sum 1"           (assertEq (squareOfSum 1) 1)
  , test "square of sum 5"           (assertEq (squareOfSum 5) 225)
  , test "square of sum 100"         (assertEq (squareOfSum 100) 25502500)
  , test "sum of squares 1"          (assertEq (sumOfSquares 1) 1)
  , test "sum of squares 5"          (assertEq (sumOfSquares 5) 55)
  , test "sum of squares 100"        (assertEq (sumOfSquares 100) 338350)
  , test "difference of squares 1"   (assertEq (differenceOfSquares 1) 0)
  , test "difference of squares 5"   (assertEq (differenceOfSquares 5) 170)
  , test "difference of squares 100" (assertEq (differenceOfSquares 100) 25164150)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
