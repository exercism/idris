module Main

import System
import Tester
import Tester.Runner

import HelloWorld

tests : List Test
tests = 
  [ test "hello should have correct value" $ do
      assertEq hello "Hello, World!"
  ]

main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
