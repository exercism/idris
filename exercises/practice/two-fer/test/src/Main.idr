module Main

import System
import Tester
import Tester.Runner

import TwoFer

tests : List Test
tests =
  [ test "no name given"      (assertEq (twoFer $ Nothing) "One for you, one for me.")
  , test "a name given"       (assertEq (twoFer $ Just "Alice") "One for Alice, one for me.")
  , test "another name given" (assertEq (twoFer $ Just "Bob") "One for Bob, one for me.")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
