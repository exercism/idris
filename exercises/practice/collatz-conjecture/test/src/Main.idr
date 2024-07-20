module Main

import System
import Tester
import Tester.Runner

import CollatzConjecture

tests : List Test
tests =
  [ test "zero steps for one"                 (assertEq (steps 1) $ Just 0)
  , test "divide if even"                     (assertEq (steps 16) $ Just 4)
  , test "even and odd steps"                 (assertEq (steps 12) $ Just 9)
  , test "large number of even and odd steps" (assertEq (steps 1000000) $ Just 152)
  , test "zero is an error"                   (assertEq (steps 0) $ Nothing)
  , test "negative value is an error"         (assertEq (steps $ -15) $ Nothing)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
