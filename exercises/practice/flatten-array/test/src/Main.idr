module Main

import System
import Tester
import Tester.Runner

import FlattenArray

tests : List Test
tests =
  [ test "empty"                                                                               (assertEq (flatten $ Branch []) [])
  , test "no nesting"                                                                          (assertEq (flatten $ Branch [Leaf 0, Leaf 1, Leaf 2]) [0, 1, 2])
  , test "flattens a nested array"                                                             (assertEq (flatten $ Branch [Branch [Branch []]]) [])
  , test "flattens array with just integers present"                                           (assertEq (flatten $ Branch [Leaf 1, Branch [Leaf 2, Leaf 3, Leaf 4, Leaf 5, Leaf 6, Leaf 7], Leaf 8]) [1, 2, 3, 4, 5, 6, 7, 8])
  , test "5 level nesting"                                                                     (assertEq (flatten $ Branch [Leaf 0, Leaf 2, Branch [Branch [Leaf 2, Leaf 3], Leaf 8, Leaf 100, Leaf 4, Branch [Branch [Branch [Leaf 50]]]], Leaf (-2)]) [0, 2, 2, 3, 8, 100, 4, 50, -2])
  , test "6 level nesting"                                                                     (assertEq (flatten $ Branch [Leaf 1, Branch [Leaf 2, Branch [Branch [Leaf 3]], Branch [Leaf 4, Branch [Branch [Leaf 5]]], Leaf 6, Leaf 7], Leaf 8]) [1, 2, 3, 4, 5, 6, 7, 8])
  , test "null values are omitted from the final result"                                       (assertEq (flatten $ Branch [Leaf 1, Leaf 2, Hollow]) [1, 2])
  , test "consecutive null values at the front of the list are omitted from the final result"  (assertEq (flatten $ Branch [Hollow, Hollow, Leaf 3]) [3])
  , test "consecutive null values in the middle of the list are omitted from the final result" (assertEq (flatten $ Branch [Leaf 1, Hollow, Hollow, Leaf 4]) [1, 4])
  , test "6 level nest list with null values"                                                  (assertEq (flatten $ Branch [Leaf 0, Leaf 2, Branch [Branch [Leaf 2, Leaf 3], Leaf 8, Branch [Branch [Leaf 100]], Hollow, Branch [Branch [Hollow]]], Leaf (-2)]) [0, 2, 2, 3, 8, 100, -2])
  , test "all values in nested list are null"                                                  (assertEq (flatten $ Branch [Hollow, Branch [Branch [Branch [Hollow]]], Hollow, Hollow, Branch [Branch [Hollow, Hollow], Hollow], Hollow]) [])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
