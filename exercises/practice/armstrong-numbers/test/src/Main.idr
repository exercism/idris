module Main

import System
import Tester
import Tester.Runner

import ArmstrongNumbers

tests : List Test
tests =
  [ test "Zero is an Armstrong number"                        (assert $       isArmstrongNumber 0)
  , test "Single-digit numbers are Armstrong numbers"         (assert $       isArmstrongNumber 5)
  , test "There are no two-digit Armstrong numbers"           (assert $ not $ isArmstrongNumber 10)
  , test "Three-digit number that is an Armstrong number"     (assert $       isArmstrongNumber 153)
  , test "Three-digit number that is not an Armstrong number" (assert $ not $ isArmstrongNumber 100)
  , test "Four-digit number that is an Armstrong number"      (assert $       isArmstrongNumber 9474)
  , test "Four-digit number that is not an Armstrong number"  (assert $ not $ isArmstrongNumber 9475)
  , test "Seven-digit number that is an Armstrong number"     (assert $       isArmstrongNumber 9926315)
  , test "Seven-digit number that is not an Armstrong number" (assert $ not $ isArmstrongNumber 9926314)
  , test "Armstrong number containing seven zeroes"           (assert $       isArmstrongNumber 186709961001538790100634132976990)
  , test "The largest and last Armstrong number"              (assert $       isArmstrongNumber 115132219018763992565095597973971522401)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
