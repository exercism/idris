module Main

import System
import Tester
import Tester.Runner

import ResistorColorTrio
import Data.Vect

tests : List Test
tests =
  [ test "Orange and orange and black"                   (assertEq (label ["orange", "orange", "black"]) $ Just "33 ohms")
  , test "Blue and grey and brown"                       (assertEq (label ["blue", "grey", "brown"]) $ Just "680 ohms")
  , test "Red and black and red"                         (assertEq (label ["red", "black", "red"]) $ Just "2 kiloohms")
  , test "Green and brown and orange"                    (assertEq (label ["green", "brown", "orange"]) $ Just "51 kiloohms")
  , test "Yellow and violet and yellow"                  (assertEq (label ["yellow", "violet", "yellow"]) $ Just "470 kiloohms")
  , test "Blue and violet and blue"                      (assertEq (label ["blue", "violet", "blue"]) $ Just "67 megaohms")
  , test "Minimum possible value"                        (assertEq (label ["black", "black", "black"]) $ Just "0 ohms")
  , test "Maximum possible value"                        (assertEq (label ["white", "white", "white"]) $ Just "99 gigaohms")
  , test "First two colors make an invalid octal number" (assertEq (label ["black", "grey", "black"]) $ Just "8 ohms")
  , test "Orange and orange and red"                     (assertEq (label ["orange", "orange", "red"]) $ Just "3.3 kiloohms")
  , test "Orange and orange and green"                   (assertEq (label ["orange", "orange", "green"]) $ Just "3.3 megaohms")
  , test "White and white and violet"                    (assertEq (label ["white", "white", "violet"]) $ Just "990 megaohms")
  , test "White and white and grey"                      (assertEq (label ["white", "white", "grey"]) $ Just "9.9 gigaohms")
  , test "First color invalid"                           (assertEq (label ["teal", "red", "orange"]) $ Nothing)
  , test "Second color invalid"                          (assertEq (label ["brown", "teal", "orange"]) $ Nothing)
  , test "Third color invalid"                           (assertEq (label ["brown", "red", "teal"]) $ Nothing)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
