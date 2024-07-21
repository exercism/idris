module Main

import System
import Tester
import Tester.Runner

import PrimeFactors

tests : List Test
tests =
  [ test "no factors"                        (assertEq (factors 1) [])
  , test "prime number"                      (assertEq (factors 2) [2])
  , test "another prime number"              (assertEq (factors 3) [3])
  , test "square of a prime"                 (assertEq (factors 9) [3, 3])
  , test "product of first prime"            (assertEq (factors 4) [2, 2])
  , test "cube of a prime"                   (assertEq (factors 8) [2, 2, 2])
  , test "product of second prime"           (assertEq (factors 27) [3, 3, 3])
  , test "product of third prime"            (assertEq (factors 625) [5, 5, 5, 5])
  , test "product of first and second prime" (assertEq (factors 6) [2, 3])
  , test "product of primes and non-primes"  (assertEq (factors 12) [2, 2, 3])
  , test "product of primes"                 (assertEq (factors 901255) [5, 17, 23, 461])
  , test "factors include a large prime"     (assertEq (factors 93819012551) [11, 9539, 894119])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
