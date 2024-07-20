module Main

import System
import Tester
import Tester.Runner

import Leap

tests : List Test
tests =
  [ test "year not divisible by 4 in common year"                      (assert $ not $ isLeap 2015)
  , test "year divisible by 2, not divisible by 4 in common year"      (assert $ not $ isLeap 1970)
  , test "year divisible by 4, not divisible by 100 in leap year"      (assert $       isLeap 1996)
  , test "year divisible by 4 and 5 is still a leap year"              (assert $       isLeap 1960)
  , test "year divisible by 100, not divisible by 400 in common year"  (assert $ not $ isLeap 2100)
  , test "year divisible by 100 but not by 3 is still not a leap year" (assert $ not $ isLeap 1900)
  , test "year divisible by 400 is leap year"                          (assert $       isLeap 2000)
  , test "year divisible by 400 but not by 125 is still a leap year"   (assert $       isLeap 2400)
  , test "year divisible by 200, not divisible by 400 in common year"  (assert $ not $ isLeap 1800)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
