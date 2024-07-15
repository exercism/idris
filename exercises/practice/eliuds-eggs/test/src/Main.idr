module Main

import System
import Tester
import Tester.Runner

import EliudsEggs

tests : List Test
tests = map (test "")
  [ assertEq (eggCount 0) 0
  , assertEq (eggCount 16) 1
  , assertEq (eggCount 89) 4
  , assertEq (eggCount 2000000000) 13
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
