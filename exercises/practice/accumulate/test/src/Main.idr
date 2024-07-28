module Main

import System
import Tester
import Tester.Runner

import Accumulate
import Data.String

tests : List Test
tests =
  [ test "accumulate empty"            (assertEq (accumulate (\x => x * x) []) (the (List Int) []))
  , test "accumulate squares"          (assertEq (accumulate (\x => x * x) [1, 2, 3]) [1, 4, 9])
  , test "accumulate upcases"          (assertEq (accumulate Data.String.toUpper ["Hello", "world"]) ["HELLO", "WORLD"])
  , test "accumulate reversed strings" (assertEq (accumulate (pack . reverse . unpack) ["the", "quick", "brown", "fox", "etc"]) ["eht", "kciuq", "nworb", "xof", "cte"])
  , test "accumulate recursively"      (assertEq (accumulate (\x => accumulate (\y => x ++ y) ["1", "2", "3"]) ["a", "b", "c"]) [["a1", "a2", "a3"], ["b1", "b2", "b3"], ["c1", "c2", "c3"]])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
