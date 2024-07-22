module Main

import System
import Tester
import Tester.Runner

import Isogram

tests : List Test
tests =
  [ test "empty string"                                                    (assert $       isIsogram "")
  , test "isogram with only lower case characters"                         (assert $       isIsogram "isogram")
  , test "word with one duplicated character"                              (assert $ not $ isIsogram "eleven")
  , test "word with one duplicated character from the end of the alphabet" (assert $ not $ isIsogram "zzyzx")
  , test "longest reported english isogram"                                (assert $       isIsogram "subdermatoglyphic")
  , test "word with duplicated character in mixed case"                    (assert $ not $ isIsogram "Alphabet")
  , test "word with duplicated character in mixed case, lowercase first"   (assert $ not $ isIsogram "alphAbet")
  , test "hypothetical isogrammic word with hyphen"                        (assert $       isIsogram "thumbscrew-japingly")
  , test "hypothetical word with duplicated character following hyphen"    (assert $ not $ isIsogram "thumbscrew-jappingly")
  , test "isogram with duplicated hyphen"                                  (assert $       isIsogram "six-year-old")
  , test "made-up name that is an isogram"                                 (assert $       isIsogram "Emily Jung Schwartzkopf")
  , test "duplicated character in the middle"                              (assert $ not $ isIsogram "accentor")
  , test "same first and last characters"                                  (assert $ not $ isIsogram "angola")
  , test "word with duplicated character and with two hyphens"             (assert $ not $ isIsogram "up-to-date")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
