module Main

import System
import Tester
import Tester.Runner

import ScrabbleScore

tests : List Test
tests =
  [ test "lowercase letter"          (assertEq (score "a") 1)
  , test "uppercase letter"          (assertEq (score "A") 1)
  , test "valuable letter"           (assertEq (score "f") 4)
  , test "short word"                (assertEq (score "at") 2)
  , test "short, valuable word"      (assertEq (score "zoo") 12)
  , test "medium word"               (assertEq (score "street") 6)
  , test "medium, valuable word"     (assertEq (score "quirky") 22)
  , test "long, mixed-case word"     (assertEq (score "OxyphenButazone") 41)
  , test "english-like word"         (assertEq (score "pinata") 8)
  , test "empty input"               (assertEq (score "") 0)
  , test "entire alphabet available" (assertEq (score "abcdefghijklmnopqrstuvwxyz") 87)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
