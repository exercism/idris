module Main

import System
import Tester
import Tester.Runner

import HelloWorld

tests : List Test
tests =
  [ test "Say Hi!" (assertEq hello "Hello, World!")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
