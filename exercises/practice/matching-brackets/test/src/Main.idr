module Main

import System
import Tester
import Tester.Runner

import MatchingBrackets

tests : List Test
tests =
  [ test "paired square brackets"                                     (assert $       isPaired "[]")
  , test "empty string"                                               (assert $       isPaired "")
  , test "unpaired brackets"                                          (assert $ not $ isPaired "[[")
  , test "wrong ordered brackets"                                     (assert $ not $ isPaired "}{")
  , test "wrong closing bracket"                                      (assert $ not $ isPaired "{]")
  , test "paired with whitespace"                                     (assert $       isPaired "{ }")
  , test "partially paired brackets"                                  (assert $ not $ isPaired "{[])")
  , test "simple nested brackets"                                     (assert $       isPaired "{[]}")
  , test "several paired brackets"                                    (assert $       isPaired "{}[]")
  , test "paired and nested brackets"                                 (assert $       isPaired "([{}({}[])])")
  , test "unopened closing brackets"                                  (assert $ not $ isPaired "{[)][]}")
  , test "unpaired and nested brackets"                               (assert $ not $ isPaired "([{])")
  , test "paired and wrong nested brackets"                           (assert $ not $ isPaired "[({]})")
  , test "paired and wrong nested brackets but innermost are correct" (assert $ not $ isPaired "[({}])")
  , test "paired and incomplete brackets"                             (assert $ not $ isPaired "{}[")
  , test "too many closing brackets"                                  (assert $ not $ isPaired "[]]")
  , test "early unexpected brackets"                                  (assert $ not $ isPaired ")()")
  , test "early mismatched brackets"                                  (assert $ not $ isPaired "{)()")
  , test "math expression"                                            (assert $       isPaired "(((185 + 223.85) * 15) - 543)/2")
  , test "complex latex expression"                                   (assert $       isPaired "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
