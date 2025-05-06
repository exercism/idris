module Main

import System
import Tester
import Tester.Runner

import LargestSeriesProduct

export
implementation Eq Error where
  (==) StringContainsNonDigit StringContainsNonDigit = True
  (==) SpanExceedsStringLength SpanExceedsStringLength = True
  (==) _ _ = False

export
implementation Show Error where
  show StringContainsNonDigit = "StringContainsNonDigit"
  show SpanExceedsStringLength = "SpanExceedsStringLength"

tests : List Test
tests =
  [ test "finds the largest product if span equals length"          (assertEq (largestProduct "29" 2) $ Right 18)
  , test "can find the largest product of 2 with numbers in order"  (assertEq (largestProduct "0123456789" 2) $ Right 72)
  , test "can find the largest product of 2"                        (assertEq (largestProduct "576802143" 2) $ Right 48)
  , test "can find the largest product of 3 with numbers in order"  (assertEq (largestProduct "0123456789" 3) $ Right 504)
  , test "can find the largest product of 3"                        (assertEq (largestProduct "1027839564" 3) $ Right 270)
  , test "can find the largest product of 5 with numbers in order"  (assertEq (largestProduct "0123456789" 5) $ Right 15120)
  , test "can get the largest product of a big number"              (assertEq (largestProduct "73167176531330624919225119674426574742355349194934" 6) $ Right 23520)
  , test "reports zero if the only digits are zero"                 (assertEq (largestProduct "0000" 2) $ Right 0)
  , test "reports zero if all spans include zero"                   (assertEq (largestProduct "99099" 3) $ Right 0)
  , test "rejects span longer than string length"                   (assertEq (largestProduct "123" 4) $ Left SpanExceedsStringLength)
  , test "reports 1 for empty string and empty product (0 span)"    (assertEq (largestProduct "" 0) $ Right 1)
  , test "reports 1 for nonempty string and empty product (0 span)" (assertEq (largestProduct "123" 0) $ Right 1)
  , test "rejects empty string and nonzero span"                    (assertEq (largestProduct "" 1) $ Left SpanExceedsStringLength)
  , test "rejects invalid character in digits"                      (assertEq (largestProduct "1234a5" 2) $ Left StringContainsNonDigit)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
