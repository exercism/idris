module Main

import System
import Tester
import Tester.Runner

import AllYourBase

export
implementation Eq Error where
  (==) InvalidBase InvalidBase = True
  (==) InvalidDigit InvalidDigit = True
  (==) _ _ = False

export
implementation Show Error where
  show InvalidBase = "InvalidBase"
  show InvalidDigit = "InvalidDigit"

tests : List Test
tests =
  [ test "single bit one to decimal"  (assertEq (rebase 2 [1] 10) $ Right [1])
  , test "binary to single decimal"   (assertEq (rebase 2 [1, 0, 1] 10) $ Right [5])
  , test "single decimal to binary"   (assertEq (rebase 10 [5] 2) $ Right [1, 0, 1])
  , test "binary to multiple decimal" (assertEq (rebase 2 [1, 0, 1, 0, 1, 0] 10) $ Right [4, 2])
  , test "decimal to binary"          (assertEq (rebase 10 [4, 2] 2) $ Right [1, 0, 1, 0, 1, 0])
  , test "trinary to hexadecimal"     (assertEq (rebase 3 [1, 1, 2, 0] 16) $ Right [2, 10])
  , test "hexadecimal to trinary"     (assertEq (rebase 16 [2, 10] 3) $ Right [1, 1, 2, 0])
  , test "15-bit integer"             (assertEq (rebase 97 [3, 46, 60] 73) $ Right [6, 10, 45])
  , test "empty list"                 (assertEq (rebase 2 [] 10) $ Right [0])
  , test "single zero"                (assertEq (rebase 10 [0] 2) $ Right [0])
  , test "multiple zeros"             (assertEq (rebase 10 [0, 0, 0] 2) $ Right [0])
  , test "leading zeros"              (assertEq (rebase 7 [0, 6, 0] 10) $ Right [4, 2])
  , test "input base is one"          (assertEq (rebase 1 [0] 10) $ Left InvalidBase)
  , test "input base is zero"         (assertEq (rebase 0 [] 10) $ Left InvalidBase)
  , test "input base is negative"     (assertEq (rebase (-2) [1] 10) $ Left InvalidBase)
  , test "negative digit"             (assertEq (rebase 2 [1, -1, 1, 0, 1, 0] 10) $ Left InvalidDigit)
  , test "invalid positive digit"     (assertEq (rebase 2 [1, 2, 1, 0, 1, 0] 10) $ Left InvalidDigit)
  , test "output base is one"         (assertEq (rebase 2 [1, 0, 1, 0, 1, 0] 1) $ Left InvalidBase)
  , test "output base is zero"        (assertEq (rebase 10 [7] 0) $ Left InvalidBase)
  , test "output base is negative"    (assertEq (rebase 2 [1] (-7)) $ Left InvalidBase)
  , test "both bases are negative"    (assertEq (rebase (-2) [1] (-7)) $ Left InvalidBase)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
