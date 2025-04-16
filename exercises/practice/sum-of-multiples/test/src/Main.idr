module Main

import System
import Tester
import Tester.Runner

import SumOfMultiples

tests : List Test
tests =
  [ test "no multiples within limit"                                                 (assertEq (sum [3, 5] 1) 0)
  , test "one factor has multiples within limit"                                     (assertEq (sum [3, 5] 4) 3)
  , test "more than one multiple within limit"                                       (assertEq (sum [3] 7) 9)
  , test "more than one factor with multiples within limit"                          (assertEq (sum [3, 5] 10) 23)
  , test "each multiple is only counted once"                                        (assertEq (sum [3, 5] 100) 2318)
  , test "a much larger limit"                                                       (assertEq (sum [3, 5] 1000) 233168)
  , test "three factors"                                                             (assertEq (sum [7, 13, 17] 20) 51)
  , test "factors not relatively prime"                                              (assertEq (sum [4, 6] 15) 30)
  , test "some pairs of factors relatively prime and some not"                       (assertEq (sum [5, 6, 8] 150) 4419)
  , test "one factor is a multiple of another"                                       (assertEq (sum [5, 25] 51) 275)
  , test "much larger factors"                                                       (assertEq (sum [43, 47] 10000) 2203160)
  , test "all numbers are multiples of 1"                                            (assertEq (sum [1] 100) 4950)
  , test "no factors means an empty sum"                                             (assertEq (sum [] 10000) 0)
  , test "the only multiple of 0 is 0"                                               (assertEq (sum [0] 1) 0)
  , test "the factor 0 does not affect the sum of multiples of other factors"        (assertEq (sum [3, 0] 4) 3)
  , test "solutions using include-exclude must extend to cardinality greater than 3" (assertEq (sum [2, 3, 5, 7, 11] 10000) 39614537)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
