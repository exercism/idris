module Main

import System
import Tester
import Tester.Runner

import Knapsack

tests : List Test
tests =
  [ test "no items"                                (assertEq (maximumValue 100 (the (List Item) [])) 0)
  , test "one item, too heavy"                     (assertEq (maximumValue 10 [item 100 1]) 0)
  , test "five items (cannot be greedy by weight)" (assertEq (maximumValue 10 [item 2 5, item 2 5, item 2 5, item 2 5, item 10 21]) 21)
  , test "five items (cannot be greedy by value)"  (assertEq (maximumValue 10 [item 2 20, item 2 20, item 2 20, item 2 20, item 10 50]) 80)
  , test "example knapsack"                        (assertEq (maximumValue 10 [item 5 10, item 4 40, item 6 30, item 4 50]) 90)
  , test "8 items"                                 (assertEq (maximumValue 104 [item 25 350, item 35 400, item 45 450, item 5 20, item 25 70, item 3 8, item 2 5, item 2 5]) 900)
  , test "15 items"                                (assertEq (maximumValue 750 [item 70 135, item 73 139, item 77 149, item 80 150, item 82 156, item 87 163, item 90 173, item 94 184, item 98 192, item 106 201, item 110 210, item 113 214, item 115 221, item 118 229, item 120 240]) 1458)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
