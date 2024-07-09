module Main

import System
import Tester
import Tester.Runner

import Leap

assertFalse : Bool -> Test
assertFalse x = test "" $ do 
  assertEq x False

assertTrue : Bool -> Test
assertTrue x = test "" $ do 
  assertEq x True

tests : List Test
tests = 
  [ assertFalse (isLeap 2015)
  , assertTrue  (isLeap 2016)
  , assertFalse (isLeap 2100)
  , assertTrue  (isLeap 2000)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
