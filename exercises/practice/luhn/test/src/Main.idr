module Main

import System
import Tester
import Tester.Runner

import Luhn

tests : List Test
tests =
  [ test "single digit strings can not be valid"                                                     (assert $ not $ isValid "1")
  , test "a single zero is invalid"                                                                  (assert $ not $ isValid "0")
  , test "a simple valid SIN that remains valid if reversed"                                         (assert $       isValid "059")
  , test "a simple valid SIN that becomes invalid if reversed"                                       (assert $       isValid "59")
  , test "a valid Canadian SIN"                                                                      (assert $       isValid "055 444 285")
  , test "invalid Canadian SIN"                                                                      (assert $ not $ isValid "055 444 286")
  , test "invalid credit card"                                                                       (assert $ not $ isValid "8273 1232 7352 0569")
  , test "invalid long number with an even remainder"                                                (assert $ not $ isValid "1 2345 6789 1234 5678 9012")
  , test "invalid long number with a remainder divisible by 5"                                       (assert $ not $ isValid "1 2345 6789 1234 5678 9013")
  , test "valid number with an even number of digits"                                                (assert $       isValid "095 245 88")
  , test "valid number with an odd number of spaces"                                                 (assert $       isValid "234 567 891 234")
  , test "valid strings with a non-digit added at the end become invalid"                            (assert $ not $ isValid "059a")
  , test "valid strings with punctuation included become invalid"                                    (assert $ not $ isValid "055-444-285")
  , test "valid strings with symbols included become invalid"                                        (assert $ not $ isValid "055# 444$ 285")
  , test "single zero with space is invalid"                                                         (assert $ not $ isValid " 0")
  , test "more than a single zero is valid"                                                          (assert $       isValid "0000 0")
  , test "input digit 9 is correctly converted to output digit 9"                                    (assert $       isValid "091")
  , test "very long input is valid"                                                                  (assert $       isValid "9999999999 9999999999 9999999999 9999999999")
  , test "valid luhn with an odd number of digits and non zero first digit"                          (assert $       isValid "109")
  , test "using ascii value for non-doubled non-digit isn't allowed"                                 (assert $ not $ isValid "055b 444 285")
  , test "using ascii value for doubled non-digit isn't allowed"                                     (assert $ not $ isValid ":9")
  , test "non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed" (assert $ not $ isValid "59%59")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
