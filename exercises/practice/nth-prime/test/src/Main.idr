module Main

import System
import Tester
import Tester.Runner

import NthPrime

tests : List Test
tests =
  [ test "first prime"  (assertEq (prime 1) 2)
  , test "second prime" (assertEq (prime 2) 3)
  , test "sixth prime"  (assertEq (prime 6) 13)
  , test "big prime"    (assertEq (prime 10001) 104743)
  , test "seventh prime" (assertEq (prime 7) 17)
  , test "very big prime" (assertEq (prime 65537) 821647)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
