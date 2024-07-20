module Main

import System
import Tester
import Tester.Runner

import RotationalCipher

tests : List Test
tests =
  [ test "rotate a by 0, same output as input"      (assertEq (rotate "a" 0) "a")
  , test "rotate a by 1"                            (assertEq (rotate "a" 1) "b")
  , test "rotate a by 26, same output as input"     (assertEq (rotate "a" 26) "a")
  , test "rotate m by 13"                           (assertEq (rotate "m" 13) "z")
  , test "rotate n by 13 with wrap around alphabet" (assertEq (rotate "n" 13) "a")
  , test "rotate capital letters"                   (assertEq (rotate "OMG" 5) "TRL")
  , test "rotate spaces"                            (assertEq (rotate "O M G" 5) "T R L")
  , test "rotate numbers"                           (assertEq (rotate "Testing 1 2 3 testing" 4) "Xiwxmrk 1 2 3 xiwxmrk")
  , test "rotate punctuation"                       (assertEq (rotate "Let's eat, Grandma!" 21) "Gzo'n zvo, Bmviyhv!")
  , test "rotate all letters"                       (assertEq (rotate "The quick brown fox jumps over the lazy dog." 13) "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
