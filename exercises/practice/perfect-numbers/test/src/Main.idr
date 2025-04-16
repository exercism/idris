module Main

import System
import Tester
import Tester.Runner

import PerfectNumbers

public export
implementation Eq Category where
  (==) Perfect Perfect = True
  (==) Abundant Abundant = True
  (==) Deficient Deficient = True
  (==) _ _ = False

public export
implementation Show Category where
  show Perfect = "Perfect"
  show Abundant = "Abundant"
  show Deficient = "Deficient"

tests : List Test
tests =
  [ test "Smallest perfect number is classified correctly"                  (assertEq (classify 6) $ Just Perfect)
  , test "Medium perfect number is classified correctly"                    (assertEq (classify 28) $ Just Perfect)
  , test "Large perfect number is classified correctly"                     (assertEq (classify 33550336) $ Just Perfect)
  , test "Smallest abundant number is classified correctly"                 (assertEq (classify 12) $ Just Abundant)
  , test "Medium abundant number is classified correctly"                   (assertEq (classify 30) $ Just Abundant)
  , test "Large abundant number is classified correctly"                    (assertEq (classify 33550335) $ Just Abundant)
  , test "Smallest prime deficient number is classified correctly"          (assertEq (classify 2) $ Just Deficient)
  , test "Smallest non-prime deficient number is classified correctly"      (assertEq (classify 4) $ Just Deficient)
  , test "Medium deficient number is classified correctly"                  (assertEq (classify 32) $ Just Deficient)
  , test "Large deficient number is classified correctly"                   (assertEq (classify 33550337) $ Just Deficient)
  , test "Edge case (no factors other than itself) is classified correctly" (assertEq (classify 1) $ Just Deficient)
  , test "Zero is rejected (as it is not a positive integer)"               (assertEq (classify 0) $ Nothing)
  , test "Negative integer is rejected (as it is not a positive integer)"   (assertEq (classify $ -1) $ Nothing)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
