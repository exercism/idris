module Main

import System
import Tester
import Tester.Runner

import Satellite

export
implementation Eq Tree where
  (==) Leaf Leaf = True
  (==) (Branch left1 value1 right1) (Branch left2 value2 right2) = (left1 == left2) && (value1 == value2) && (right1 == right2)
  (==) _ _ = False

export
implementation Show Tree where
  show Leaf = "Leaf"
  show (Branch left value right) = "(" ++ (show left) ++ " " ++ (show value) ++ " " ++ (show right) ++ ")"

tests : List Test
tests =
  [ test "Empty tree"                                    (assertEq (treeFromTraversals [] []) $ Just Leaf)
  , test "Tree with one item"                            (assertEq (treeFromTraversals ['a'] ['a']) $ Just (Branch Leaf 'a' Leaf))
  , test "Tree with many items"                          (assertEq (treeFromTraversals ['a', 'i', 'x', 'f', 'r'] ['i', 'a', 'f', 'x', 'r']) $ Just (Branch (Branch Leaf 'i' Leaf) 'a' (Branch (Branch Leaf 'f' Leaf) 'x' (Branch Leaf 'r' Leaf))))
  , test "Reject traversals of different length"         (assertEq (treeFromTraversals ['a', 'b'] ['b', 'a', 'r']) $ Nothing)
  , test "Reject inconsistent traversals of same length" (assertEq (treeFromTraversals ['x', 'y', 'z'] ['a', 'b', 'c']) $ Nothing)
  , test "Reject traversals with repeated items"         (assertEq (treeFromTraversals ['a', 'b', 'a'] ['b', 'a', 'a']) $ Nothing)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
