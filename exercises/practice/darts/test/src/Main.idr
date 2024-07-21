module Main

import System
import Tester
import Tester.Runner

import Darts

tests : List Test
tests =
  [ test "Missed target"                                            (assertEq (score (-9) 9) 0)
  , test "On the outer circle"                                      (assertEq (score 0 10) 1)
  , test "On the middle circle"                                     (assertEq (score (-5) 0) 5)
  , test "On the inner circle"                                      (assertEq (score 0 (-1)) 10)
  , test "Exactly on center"                                        (assertEq (score 0 0) 10)
  , test "Near the center"                                          (assertEq (score (-0.1) (-0.1)) 10)
  , test "Just within the inner circle"                             (assertEq (score 0.7 0.7) 10)
  , test "Just outside the inner circle"                            (assertEq (score 0.8 (-0.8)) 5)
  , test "Just within the middle circle"                            (assertEq (score (-3.5) 3.5) 5)
  , test "Just outside the middle circle"                           (assertEq (score (-3.6) (-3.6)) 1)
  , test "Just within the outer circle"                             (assertEq (score (-7.0) 7.0) 1)
  , test "Just outside the outer circle"                            (assertEq (score 7.1 (-7.1)) 0)
  , test "Asymmetric position between the inner and middle circles" (assertEq (score 0.5 (-4)) 5)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
