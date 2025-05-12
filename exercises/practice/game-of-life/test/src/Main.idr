module Main

import System
import Tester
import Tester.Runner

import GameOfLife
import Data.Vect

tests : List Test
tests =
  [ test "empty matrix"                                      (assertEq (tick 0 0 [
    ]
  ) [
    ]
  )
  , test "live cells with zero live neighbors die"           (assertEq (tick 3 3 [
    [0, 0, 0],
    [0, 1, 0],
    [0, 0, 0]]
  ) [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]]
  )
  , test "live cells with only one live neighbor die"        (assertEq (tick 3 3 [
    [0, 0, 0],
    [0, 1, 0],
    [0, 1, 0]]
  ) [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]]
  )
  , test "live cells with two live neighbors stay alive"     (assertEq (tick 3 3 [
    [1, 0, 1],
    [1, 0, 1],
    [1, 0, 1]]
  ) [
    [0, 0, 0],
    [1, 0, 1],
    [0, 0, 0]]
  )
  , test "live cells with three live neighbors stay alive"   (assertEq (tick 3 3 [
    [0, 1, 0],
    [1, 0, 0],
    [1, 1, 0]]
  ) [
    [0, 0, 0],
    [1, 0, 0],
    [1, 1, 0]]
  )
  , test "dead cells with three live neighbors become alive" (assertEq (tick 3 3 [
    [1, 1, 0],
    [0, 0, 0],
    [1, 0, 0]]
  ) [
    [0, 0, 0],
    [1, 1, 0],
    [0, 0, 0]]
  )
  , test "live cells with four or more neighbors die"        (assertEq (tick 3 3 [
    [1, 1, 1],
    [1, 1, 1],
    [1, 1, 1]]
  ) [
    [1, 0, 1],
    [0, 0, 0],
    [1, 0, 1]]
  )
  , test "bigger matrix"                                     (assertEq (tick 8 8 [
    [1, 1, 0, 1, 1, 0, 0, 0],
    [1, 0, 1, 1, 0, 0, 0, 0],
    [1, 1, 1, 0, 0, 1, 1, 1],
    [0, 0, 0, 0, 0, 1, 1, 0],
    [1, 0, 0, 0, 1, 1, 0, 0],
    [1, 1, 0, 0, 0, 1, 1, 1],
    [0, 0, 1, 0, 1, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 1, 1]]
  ) [
    [1, 1, 0, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 1, 0],
    [1, 0, 1, 1, 1, 1, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 1],
    [1, 1, 0, 0, 1, 0, 0, 1],
    [1, 1, 0, 1, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 1, 1]]
  )
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
