module Main

import System
import Tester
import Tester.Runner

import Bob

tests : List Test
tests =
  [ test "asking a question"                               (assertEq (response "Does this cryogenic chamber make me look fat?") "Sure.")
  , test "shouting"                                        (assertEq (response "WATCH OUT!") "Whoa, chill out!")
  , test "forceful question"                               (assertEq (response "WHAT'S GOING ON?") "Calm down, I know what I'm doing!")
  , test "silence"                                         (assertEq (response "") "Fine. Be that way!")
  , test "stating something"                               (assertEq (response "Tom-ay-to, tom-aaaah-to.") "Whatever.")
  , test "asking a numeric question"                       (assertEq (response "You are, what, like 15?") "Sure.")
  , test "asking gibberish"                                (assertEq (response "fffbbcbeab?") "Sure.")
  , test "question with no letters"                        (assertEq (response "4?") "Sure.")
  , test "non-letters with question"                       (assertEq (response ":) ?") "Sure.")
  , test "prattling on"                                    (assertEq (response "Wait! Hang on. Are you going to be OK?") "Sure.")
  , test "ending with whitespace"                          (assertEq (response "Okay if like my  spacebar  quite a bit?   ") "Sure.")
  , test "multiple line question"                          (assertEq (response "\nDoes this cryogenic chamber make\n me look fat?") "Sure.")
  , test "shouting gibberish"                              (assertEq (response "FCECDFCAAB") "Whoa, chill out!")
  , test "shouting a statement containing a question mark" (assertEq (response "DO LIONS EAT PEOPLE? AHHHHH.") "Whoa, chill out!")
  , test "shouting numbers"                                (assertEq (response "1, 2, 3 GO!") "Whoa, chill out!")
  , test "shouting with special characters"                (assertEq (response "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") "Whoa, chill out!")
  , test "shouting with no exclamation mark"               (assertEq (response "I HATE THE DENTIST") "Whoa, chill out!")
  , test "prolonged silence"                               (assertEq (response "          ") "Fine. Be that way!")
  , test "alternate silence"                               (assertEq (response "\t\t\t\t\t\t\t\t\t\t") "Fine. Be that way!")
  , test "other whitespace"                                (assertEq (response "\n\r \t") "Fine. Be that way!")
  , test "talking forcefully"                              (assertEq (response "Hi there!") "Whatever.")
  , test "using acronyms in regular speech"                (assertEq (response "It's OK if you don't want to go work for NASA.") "Whatever.")
  , test "no letters"                                      (assertEq (response "1, 2, 3") "Whatever.")
  , test "statement containing question mark"              (assertEq (response "Ending with ? means a question.") "Whatever.")
  , test "starting with whitespace"                        (assertEq (response "         hmmmmmmm...") "Whatever.")
  , test "non-question ending with whitespace"             (assertEq (response "This is a statement ending with whitespace      ") "Whatever.")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
