module Main

import System
import Tester
import Tester.Runner

import IsbnVerifier

tests : List Test
tests =
  [ test "valid isbn"                                                (assert $       isValid "3-598-21508-8")
  , test "invalid isbn check digit"                                  (assert $ not $ isValid "3-598-21508-9")
  , test "valid isbn with a check digit of 10"                       (assert $       isValid "3-598-21507-X")
  , test "check digit is a character other than X"                   (assert $ not $ isValid "3-598-21507-A")
  , test "invalid check digit in isbn is not treated as zero"        (assert $ not $ isValid "4-598-21507-B")
  , test "invalid character in isbn is not treated as zero"          (assert $ not $ isValid "3-598-P1581-X")
  , test "X is only valid as a check digit"                          (assert $ not $ isValid "3-598-2X507-9")
  , test "only one check digit is allowed"                           (assert $ not $ isValid "3-598-21508-96")
  , test "X is not substituted by the value 10"                      (assert $ not $ isValid "3-598-2X507-5")
  , test "valid isbn without separating dashes"                      (assert $       isValid "3598215088")
  , test "isbn without separating dashes and X as check digit"       (assert $       isValid "359821507X")
  , test "isbn without check digit and dashes"                       (assert $ not $ isValid "359821507")
  , test "too long isbn and no dashes"                               (assert $ not $ isValid "3598215078X")
  , test "too short isbn"                                            (assert $ not $ isValid "00")
  , test "isbn without check digit"                                  (assert $ not $ isValid "3-598-21507")
  , test "check digit of X should not be used for 0"                 (assert $ not $ isValid "3-598-21515-X")
  , test "empty isbn"                                                (assert $ not $ isValid "")
  , test "input is 9 characters"                                     (assert $ not $ isValid "134456729")
  , test "invalid characters are not ignored after checking length"  (assert $ not $ isValid "3132P34035")
  , test "invalid characters are not ignored before checking length" (assert $ not $ isValid "3598P215088")
  , test "input is too long but contains a valid isbn"               (assert $ not $ isValid "98245726788")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
