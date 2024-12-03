module Main

import System
import Tester
import Tester.Runner

import Bob

tests : List Test
tests =
  [ test "stating something"                   (assertEq (response "Tom-ay-to, tom-aaaah-to.") "Whatever.")
  , test "shouting"                            (assertEq (response "WATCH OUT!") "Whoa, chill out!")
  , test "shouting gibberish"                  (assertEq (response "FCECDFCAAB") "Whoa, chill out!")
  , test "asking a question"                   (assertEq (response "Does this cryogenic chamber make me look fat?") "Sure.")
  , test "asking a numeric question"           (assertEq (response "You are, what, like 15?") "Sure.")
  , test "asking gibberish"                    (assertEq (response "fffbbcbeab?") "Sure.")
  , test "talking forcefully"                  (assertEq (response "Hi there!") "Whatever.")
  , test "using acronyms in regular speech"    (assertEq (response "It's OK if you don't want to go work for NASA.") "Whatever.")
  , test "forceful question"                   (assertEq (response "WHAT'S GOING ON?") "Calm down, I know what I'm doing!")
  , test "shouting numbers"                    (assertEq (response "1, 2, 3 GO!") "Whoa, chill out!")
  , test "no letters"                          (assertEq (response "1, 2, 3") "Whatever.")
  , test "question with no letters"            (assertEq (response "4?") "Sure.")
  , test "shouting with special characters"    (assertEq (response "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") "Whoa, chill out!")
  , test "shouting with no exclamation mark"   (assertEq (response "I HATE THE DENTIST") "Whoa, chill out!")
  , test "statement containing question mark"  (assertEq (response "Ending with ? means a question.") "Whatever.")
  , test "non-letters with question"           (assertEq (response ":) ?") "Sure.")
  , test "prattling on"                        (assertEq (response "Wait! Hang on. Are you going to be OK?") "Sure.")
  , test "silence"                             (assertEq (response "") "Fine. Be that way!")
  , test "prolonged silence"                   (assertEq (response "          ") "Fine. Be that way!")
  , test "alternate silence"                   (assertEq (response "\t\t\t\t\t\t\t\t\t\t") "Fine. Be that way!")
  , test "starting with whitespace"            (assertEq (response "         hmmmmmmm...") "Whatever.")
  , test "ending with whitespace"              (assertEq (response "Okay if like my  spacebar  quite a bit?   ") "Sure.")
  , test "other whitespace"                    (assertEq (response "\n\r \t") "Fine. Be that way!")
  , test "non-question ending with whitespace" (assertEq (response "This is a statement ending with whitespace      ") "Whatever.")
  , test "multiple line question"              (assertEq (response "\nDoes this cryogenic chamber make\n me look fat?") "Sure.")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
