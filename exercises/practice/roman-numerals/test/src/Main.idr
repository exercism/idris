module Main

import System
import Tester
import Tester.Runner

import RomanNumerals

tests : List Test
tests =
  [ test "1 is I"                  (assertEq (roman 1) "I")
  , test "2 is II"                 (assertEq (roman 2) "II")
  , test "3 is III"                (assertEq (roman 3) "III")
  , test "4 is IV"                 (assertEq (roman 4) "IV")
  , test "5 is V"                  (assertEq (roman 5) "V")
  , test "6 is VI"                 (assertEq (roman 6) "VI")
  , test "9 is IX"                 (assertEq (roman 9) "IX")
  , test "16 is XVI"               (assertEq (roman 16) "XVI")
  , test "27 is XXVII"             (assertEq (roman 27) "XXVII")
  , test "48 is XLVIII"            (assertEq (roman 48) "XLVIII")
  , test "49 is XLIX"              (assertEq (roman 49) "XLIX")
  , test "59 is LIX"               (assertEq (roman 59) "LIX")
  , test "66 is LXVI"              (assertEq (roman 66) "LXVI")
  , test "93 is XCIII"             (assertEq (roman 93) "XCIII")
  , test "141 is CXLI"             (assertEq (roman 141) "CXLI")
  , test "163 is CLXIII"           (assertEq (roman 163) "CLXIII")
  , test "166 is CLXVI"            (assertEq (roman 166) "CLXVI")
  , test "402 is CDII"             (assertEq (roman 402) "CDII")
  , test "575 is DLXXV"            (assertEq (roman 575) "DLXXV")
  , test "666 is DCLXVI"           (assertEq (roman 666) "DCLXVI")
  , test "911 is CMXI"             (assertEq (roman 911) "CMXI")
  , test "1024 is MXXIV"           (assertEq (roman 1024) "MXXIV")
  , test "1666 is MDCLXVI"         (assertEq (roman 1666) "MDCLXVI")
  , test "3000 is MMM"             (assertEq (roman 3000) "MMM")
  , test "3001 is MMMI"            (assertEq (roman 3001) "MMMI")
  , test "3888 is MMMDCCCLXXXVIII" (assertEq (roman 3888) "MMMDCCCLXXXVIII")
  , test "3999 is MMMCMXCIX"       (assertEq (roman 3999) "MMMCMXCIX")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
