module Main

import System
import Tester
import Tester.Runner

import RunLengthEncoding

tests : List Test
tests =
  [ test "empty string"                                     (assertEq (encode "") "")
  , test "single characters only are encoded without count" (assertEq (encode "XYZ") "XYZ")
  , test "string with no single characters"                 (assertEq (encode "AABBBCCCC") "2A3B4C")
  , test "single characters mixed with repeated characters" (assertEq (encode "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") "12WB12W3B24WB")
  , test "multiple whitespace mixed in string"              (assertEq (encode "  hsqq qww  ") "2 hs2q q2w2 ")
  , test "lowercase characters"                             (assertEq (encode "aabbbcccc") "2a3b4c")
  , test "empty string"                                     (assertEq (decode "") "")
  , test "single characters only"                           (assertEq (decode "XYZ") "XYZ")
  , test "string with no single characters"                 (assertEq (decode "2A3B4C") "AABBBCCCC")
  , test "single characters with repeated characters"       (assertEq (decode "12WB12W3B24WB") "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
  , test "multiple whitespace mixed in string"              (assertEq (decode "2 hs2q q2w2 ") "  hsqq qww  ")
  , test "lowercase string"                                 (assertEq (decode "2a3b4c") "aabbbcccc")
  , test "encode followed by decode gives original string"  (assertEq (decode $ encode "zzz ZZ  zZ") "zzz ZZ  zZ")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
