module Main

import System
import Tester
import Tester.Runner

import EliudsEggs

tests : List Test
tests =
  [ test "0 eggs"  (assertEq (eggCount 0) 0)
  , test "1 egg"   (assertEq (eggCount 16) 1)
  , test "4 eggs"  (assertEq (eggCount 89) 4)
  , test "13 eggs" (assertEq (eggCount 2000000000) 13)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
