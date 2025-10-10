module Main

import System
import Tester
import Tester.Runner

import LineUp

tests : List Test
tests =
  [ test "format smallest non-exceptional ordinal numeral 4"              (
      assertEq (format "Gianna" 4) "Gianna, you are the 4th customer we serve today. Thank you!")
  , test "format greatest single digit non-exceptional ordinal numeral 9" (
      assertEq (format "Maarten" 9) "Maarten, you are the 9th customer we serve today. Thank you!")
  , test "format non-exceptional ordinal numeral 5"                       (
      assertEq (format "Petronila" 5) "Petronila, you are the 5th customer we serve today. Thank you!")
  , test "format non-exceptional ordinal numeral 6"                       (
      assertEq (format "Attakullakulla" 6) "Attakullakulla, you are the 6th customer we serve today. Thank you!")
  , test "format non-exceptional ordinal numeral 7"                       (
      assertEq (format "Kate" 7) "Kate, you are the 7th customer we serve today. Thank you!")
  , test "format non-exceptional ordinal numeral 8"                       (
      assertEq (format "Maximiliano" 8) "Maximiliano, you are the 8th customer we serve today. Thank you!")
  , test "format exceptional ordinal numeral 1"                           (
      assertEq (format "Mary" 1) "Mary, you are the 1st customer we serve today. Thank you!")
  , test "format exceptional ordinal numeral 2"                           (
      assertEq (format "Haruto" 2) "Haruto, you are the 2nd customer we serve today. Thank you!")
  , test "format exceptional ordinal numeral 3"                           (
      assertEq (format "Henriette" 3) "Henriette, you are the 3rd customer we serve today. Thank you!")
  , test "format smallest two digit non-exceptional ordinal numeral 10"   (
      assertEq (format "Alvarez" 10) "Alvarez, you are the 10th customer we serve today. Thank you!")
  , test "format non-exceptional ordinal numeral 11"                      (
      assertEq (format "Jacqueline" 11) "Jacqueline, you are the 11th customer we serve today. Thank you!")
  , test "format non-exceptional ordinal numeral 12"                      (
      assertEq (format "Juan" 12) "Juan, you are the 12th customer we serve today. Thank you!")
  , test "format non-exceptional ordinal numeral 13"                      (
      assertEq (format "Patricia" 13) "Patricia, you are the 13th customer we serve today. Thank you!")
  , test "format exceptional ordinal numeral 21"                          (
      assertEq (format "Washi" 21) "Washi, you are the 21st customer we serve today. Thank you!")
  , test "format exceptional ordinal numeral 62"                          (
      assertEq (format "Nayra" 62) "Nayra, you are the 62nd customer we serve today. Thank you!")
  , test "format exceptional ordinal numeral 100"                         (
      assertEq (format "John" 100) "John, you are the 100th customer we serve today. Thank you!")
  , test "format exceptional ordinal numeral 101"                         (
      assertEq (format "Zeinab" 101) "Zeinab, you are the 101st customer we serve today. Thank you!")
  , test "format non-exceptional ordinal numeral 112"                     (
      assertEq (format "Knud" 112) "Knud, you are the 112th customer we serve today. Thank you!")
  , test "format exceptional ordinal numeral 123"                         (
      assertEq (format "Yma" 123) "Yma, you are the 123rd customer we serve today. Thank you!")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
