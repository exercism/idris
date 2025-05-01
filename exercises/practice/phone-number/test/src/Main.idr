module Main

import System
import Tester
import Tester.Runner

import PhoneNumber

tests : List Test
tests =
  [ test "cleans the number"                                               (assertEq (clean "(223) 456-7890") $ Just "2234567890")
  , test "cleans numbers with dots"                                        (assertEq (clean "223.456.7890") $ Just "2234567890")
  , test "cleans numbers with multiple spaces"                             (assertEq (clean "223 456   7890   ") $ Just "2234567890")
  , test "invalid when 9 digits"                                           (assertEq (clean "123456789") $ Nothing)
  , test "invalid when 11 digits does not start with a 1"                  (assertEq (clean "22234567890") $ Nothing)
  , test "valid when 11 digits and starting with 1"                        (assertEq (clean "12234567890") $ Just "2234567890")
  , test "valid when 11 digits and starting with 1 even with punctuation"  (assertEq (clean "+1 (223) 456-7890") $ Just "2234567890")
  , test "invalid when more than 11 digits"                                (assertEq (clean "321234567890") $ Nothing)
  , test "invalid with letters"                                            (assertEq (clean "523-abc-7890") $ Nothing)
  , test "invalid with punctuations"                                       (assertEq (clean "523-@:!-7890") $ Nothing)
  , test "invalid if area code starts with 0"                              (assertEq (clean "(023) 456-7890") $ Nothing)
  , test "invalid if area code starts with 1"                              (assertEq (clean "(123) 456-7890") $ Nothing)
  , test "invalid if exchange code starts with 0"                          (assertEq (clean "(223) 056-7890") $ Nothing)
  , test "invalid if exchange code starts with 1"                          (assertEq (clean "(223) 156-7890") $ Nothing)
  , test "invalid if area code starts with 0 on valid 11-digit number"     (assertEq (clean "1 (023) 456-7890") $ Nothing)
  , test "invalid if area code starts with 1 on valid 11-digit number"     (assertEq (clean "1 (123) 456-7890") $ Nothing)
  , test "invalid if exchange code starts with 0 on valid 11-digit number" (assertEq (clean "1 (223) 056-7890") $ Nothing)
  , test "invalid if exchange code starts with 1 on valid 11-digit number" (assertEq (clean "1 (223) 156-7890") $ Nothing)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
