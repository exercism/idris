module Main

import System
import Tester
import Tester.Runner

import MicroBlog

tests : List Test
tests =
  [ test "English language short"                      (assertEq (truncate "Hi") "Hi")
  , test "English language long"                       (assertEq (truncate "Hello there") "Hello")
  , test "German language short (broth)"               (assertEq (truncate "brühe") "brühe")
  , test "German language long (bear carpet → beards)" (assertEq (truncate "Bärteppich") "Bärte")
  , test "Bulgarian language short (good)"             (assertEq (truncate "Добър") "Добър")
  , test "Greek language short (health)"               (assertEq (truncate "υγειά") "υγειά")
  , test "Maths short"                                 (assertEq (truncate "a=πr²") "a=πr²")
  , test "Maths long"                                  (assertEq (truncate "∅⊊ℕ⊊ℤ⊊ℚ⊊ℝ⊊ℂ") "∅⊊ℕ⊊ℤ")
  , test "English and emoji short"                     (assertEq (truncate "Fly 🛫") "Fly 🛫")
  , test "Emoji short"                                 (assertEq (truncate "💇") "💇")
  , test "Emoji long"                                  (assertEq (truncate "❄🌡🤧🤒🏥🕰😀") "❄🌡🤧🤒🏥")
  , test "Royal Flush?"                                (assertEq (truncate "🃎🂸🃅🃋🃍🃁🃊") "🃎🂸🃅🃋🃍")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
