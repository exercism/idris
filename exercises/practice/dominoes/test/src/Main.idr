module Main

import System
import Tester
import Tester.Runner

import Dominoes
import Data.Vect

tests : List Test
tests =
  [ test "empty input = empty output"         (assert $       canChain [])
  , test "singleton input = singleton output" (assert $       canChain [[1, 1]])
  , test "singleton that can't be chained"    (assert $ not $ canChain [[1, 2]])
  , test "three elements"                     (assert $       canChain [[1, 2], [3, 1], [2, 3]])
  , test "can reverse dominoes"               (assert $       canChain [[1, 2], [1, 3], [2, 3]])
  , test "can't be chained"                   (assert $ not $ canChain [[1, 2], [4, 1], [2, 3]])
  , test "disconnected - simple"              (assert $ not $ canChain [[1, 1], [2, 2]])
  , test "disconnected - double loop"         (assert $ not $ canChain [[1, 2], [2, 1], [3, 4], [4, 3]])
  , test "disconnected - single isolated"     (assert $ not $ canChain [[1, 2], [2, 3], [3, 1], [4, 4]])
  , test "need backtrack"                     (assert $       canChain [[1, 2], [2, 3], [3, 1], [2, 4], [2, 4]])
  , test "separate loops"                     (assert $       canChain [[1, 2], [2, 3], [3, 1], [1, 1], [2, 2], [3, 3]])
  , test "nine elements"                      (assert $       canChain [[1, 2], [5, 3], [3, 1], [1, 2], [2, 4], [1, 6], [2, 3], [3, 4], [5, 6]])
  , test "separate three-domino loops"        (assert $ not $ canChain [[1, 2], [2, 3], [3, 1], [4, 5], [5, 6], [6, 4]])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
