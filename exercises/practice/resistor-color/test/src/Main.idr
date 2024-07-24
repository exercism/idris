module Main

import System
import Tester
import Tester.Runner

import ResistorColor
import Data.Vect

tests : List Test
tests =
  [ test "Black"  (assertEq (colorCode "black") $ 0)
  , test "White"  (assertEq (colorCode "white") $ 9)
  , test "Orange" (assertEq (colorCode "orange") $ 3)
  , test "Colors" (assertEq colors ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
