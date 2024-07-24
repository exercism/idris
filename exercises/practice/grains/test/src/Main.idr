module Main

import System
import Tester
import Tester.Runner

import Grains

tests : List Test
tests =
  [ test "grains on square 1"                              (assertEq (grains 1) $ Just 1)
  , test "grains on square 2"                              (assertEq (grains 2) $ Just 2)
  , test "grains on square 3"                              (assertEq (grains 3) $ Just 4)
  , test "grains on square 4"                              (assertEq (grains 4) $ Just 8)
  , test "grains on square 16"                             (assertEq (grains 16) $ Just 32768)
  , test "grains on square 32"                             (assertEq (grains 32) $ Just 2147483648)
  , test "grains on square 64"                             (assertEq (grains 64) $ Just 9223372036854775808)
  , test "square 0 is invalid"                             (assertEq (grains 0) $ Nothing)
  , test "negative square is invalid"                      (assertEq (grains $ -1) $ Nothing)
  , test "square greater than 64 is invalid"               (assertEq (grains 65) $ Nothing)
  , test "returns the total number of grains on the board" (assertEq totalGrains 18446744073709551615)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
