module Main

import System
import Tester
import Tester.Runner

import Pangram

tests : List Test
tests =
  [ test "empty sentence"                                            (assert $ not $ isPangram "")
  , test "perfect lower case"                                        (assert $       isPangram "abcdefghijklmnopqrstuvwxyz")
  , test "only lower case"                                           (assert $       isPangram "the quick brown fox jumps over the lazy dog")
  , test "missing the letter 'x'"                                    (assert $ not $ isPangram "a quick movement of the enemy will jeopardize five gunboats")
  , test "missing the letter 'h'"                                    (assert $ not $ isPangram "five boxing wizards jump quickly at it")
  , test "with underscores"                                          (assert $       isPangram "the_quick_brown_fox_jumps_over_the_lazy_dog")
  , test "with numbers"                                              (assert $       isPangram "the 1 quick brown fox jumps over the 2 lazy dogs")
  , test "missing letters replaced by numbers"                       (assert $ not $ isPangram "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog")
  , test "mixed case and punctuation"                                (assert $       isPangram "\"Five quacking Zephyrs jolt my wax bed.\"")
  , test "a-m and A-M are 26 different characters but not a pangram" (assert $ not $ isPangram "abcdefghijklm ABCDEFGHIJKLM")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
