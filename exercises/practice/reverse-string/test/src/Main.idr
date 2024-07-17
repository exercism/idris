module Main

import System
import Tester
import Tester.Runner

import ReverseString

tests : List Test
tests =
  [ test "an empty string"             (assertEq (rev "") "")
  , test "a word"                      (assertEq (rev "robot") "tobor")
  , test "a capitalized word"          (assertEq (rev "Ramen") "nemaR")
  , test "a sentence with punctuation" (assertEq (rev "I'm hungry!") "!yrgnuh m'I")
  , test "a palindrome"                (assertEq (rev "racecar") "racecar")
  , test "an even-sized word"          (assertEq (rev "drawer") "reward")
  , test "wide characters"             (assertEq (rev "子猫") "猫子")
--  , test "grapheme cluster with pre-combined form" (assertEq (rev "Würstchenstand") "dnatsnehctsrüW")
--  , test "grapheme clusters"                       (assertEq (rev "ผู้เขียนโปรแกรม") "มรกแรปโนยขีเผู้")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
