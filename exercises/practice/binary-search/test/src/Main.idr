module Main

import System
import Tester
import Tester.Runner

import BinarySearch
import Data.Vect

tests : List Test
tests =
  [ test "finds a value in an array with one element"                   (assertEq (find 1 [6] 6) $ Just 0)
  , test "finds a value in the middle of an array"                      (assertEq (find 7 [1, 3, 4, 6, 8, 9, 11] 6) $ Just 3)
  , test "finds a value at the beginning of an array"                   (assertEq (find 7 [1, 3, 4, 6, 8, 9, 11] 1) $ Just 0)
  , test "finds a value at the end of an array"                         (assertEq (find 7 [1, 3, 4, 6, 8, 9, 11] 11) $ Just 6)
  , test "finds a value in an array of odd length"                      (assertEq (find 13 [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634] 144) $ Just 9)
  , test "finds a value in an array of even length"                     (assertEq (find 12 [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377] 21) $ Just 5)
  , test "identifies that a value is not included in the array"         (assertEq (find 7 [1, 3, 4, 6, 8, 9, 11] 7) $ Nothing)
  , test "a value smaller than the array's smallest value is not found" (assertEq (find 7 [1, 3, 4, 6, 8, 9, 11] 0) $ Nothing)
  , test "a value larger than the array's largest value is not found"   (assertEq (find 7 [1, 3, 4, 6, 8, 9, 11] 13) $ Nothing)
  , test "nothing is found in an empty array"                           (assertEq (find 0 (the (Vect 0 Integer) []) 1) $ Nothing)
  , test "nothing is found when the left and right bounds cross"        (assertEq (find 2 [1, 2] 0) $ Nothing)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
