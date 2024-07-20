module Main

import System
import Tester
import Tester.Runner

import SquareRoot

tests : List Test
tests =
  [ test "root of 1"     (assertEq (squareRoot 1) 1)
  , test "root of 4"     (assertEq (squareRoot 4) 2)
  , test "root of 25"    (assertEq (squareRoot 25) 5)
  , test "root of 81"    (assertEq (squareRoot 81) 9)
  , test "root of 196"   (assertEq (squareRoot 196) 14)
  , test "root of 65025" (assertEq (squareRoot 65025) 255)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
