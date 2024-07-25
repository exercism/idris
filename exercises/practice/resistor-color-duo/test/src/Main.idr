module Main

import System
import Tester
import Tester.Runner

import ResistorColorDuo
import Data.Vect

tests : List Test
tests =
  [ test "Brown and black"            (assertEq (value ["brown", "black"]) $ Just 10)
  , test "Blue and grey"              (assertEq (value ["blue", "grey"]) $ Just 68)
  , test "Yellow and violet"          (assertEq (value ["yellow", "violet"]) $ Just 47)
  , test "White and red"              (assertEq (value ["white", "red"]) $ Just 92)
  , test "Orange and orange"          (assertEq (value ["orange", "orange"]) $ Just 33)
  , test "Black and brown, one-digit" (assertEq (value ["black", "brown"]) $ Just 1)
  , test "First color invalid"        (assertEq (value ["teal", "red"]) $ Nothing)
  , test "Second color invalid"       (assertEq (value ["brown", "teal"]) $ Nothing)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
