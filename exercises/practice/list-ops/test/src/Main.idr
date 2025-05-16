module Main

import System
import Tester
import Tester.Runner

import ListOps

import Data.List
import Data.Nat

isOdd : Int -> Bool
isOdd n = (n `mod` 2) == 1

plusOne : Int -> Int
plusOne n = 1 + n

divide : Nat -> Nat -> Nat
divide acc el = if acc == 0 then 0 else el `div` acc

subtract : Int -> Int -> Int
subtract acc el = el - acc

tests : List Test
tests =
  [ test "empty lists"                                              (assertEq (ListOps.append (the (List Int) []) (the (List Int) [])) (the (List Int) []))
  , test "list to empty list"                                       (assertEq (ListOps.append (the (List Int) []) [1, 2, 3, 4]) [1, 2, 3, 4])
  , test "empty list to list"                                       (assertEq (ListOps.append [1, 2, 3, 4] (the (List Int) [])) [1, 2, 3, 4])
  , test "non-empty lists"                                          (assertEq (ListOps.append [1, 2] [2, 3, 4, 5]) [1, 2, 2, 3, 4, 5])
  , test "empty list"                                               (assertEq (ListOps.concat (the (List (List Int)) [])) (the (List Int) []))
  , test "list of lists"                                            (assertEq (ListOps.concat [[1, 2], [3], (the (List Int) []), [4, 5, 6]]) [1, 2, 3, 4, 5, 6])
  , test "list of nested lists"                                     (assertEq (ListOps.concat [[[1], [2]], [[3]], [(the (List Int) [])], [[4, 5, 6]]]) [[1], [2], [3], (the (List Int) []), [4, 5, 6]])
  , test "empty list"                                               (assertEq (ListOps.filter isOdd (the (List Int) [])) (the (List Int) []))
  , test "non-empty list"                                           (assertEq (ListOps.filter isOdd [1, 2, 3, 5]) [1, 3, 5])
  , test "empty list"                                               (assertEq (ListOps.length (the (List Int) [])) 0)
  , test "non-empty list"                                           (assertEq (ListOps.length [1, 2, 3, 4]) 4)
  , test "empty list"                                               (assertEq (ListOps.map plusOne (the (List Int) [])) (the (List Int) []))
  , test "non-empty list"                                           (assertEq (ListOps.map plusOne [1, 3, 5, 7]) [2, 4, 6, 8])
  , test "empty list"                                               (assertEq (ListOps.foldl (*) 2 (the (List Int) [])) 2)
  , test "direction independent function applied to non-empty list" (assertEq (ListOps.foldl (+) 5 [1, 2, 3, 4]) 15)
  , test "direction dependent function applied to non-empty list"   (assertEq (ListOps.foldl divide 5 [2, 5]) 0)
  , test "empty list"                                               (assertEq (ListOps.foldr (*) 2 (the (List Int) [])) 2)
  , test "direction independent function applied to non-empty list" (assertEq (ListOps.foldr (+) 5 [1, 2, 3, 4]) 15)
  , test "direction dependent function applied to non-empty list"   (assertEq (ListOps.foldr divide 5 [2, 5]) 2)
  , test "empty list"                                               (assertEq (ListOps.reverse (the (List Int) [])) (the (List Int) []))
  , test "non-empty list"                                           (assertEq (ListOps.reverse [1, 3, 5, 7]) [7, 5, 3, 1])
  , test "list of lists is not flattened"                           (assertEq (ListOps.reverse [[1, 2], [3], (the (List Int) []), [4, 5, 6]]) [[4, 5, 6], (the (List Int) []), [3], [1, 2]])
  , test "foldl with subtraction"                                   (assertEq (ListOps.foldl subtract 3 [6, 8]) 5)
  , test "foldr with subtraction"                                   (assertEq (ListOps.foldr subtract 3 [6, 8]) 1)
  , test "append long lists"                                        (assertEq (ListOps.append (replicate 3000 True) (replicate 4000 True)) (replicate 7000 True))
  , test "concat long lists"                                        (assertEq (ListOps.concat (replicate 60 (replicate 50 True))) (replicate 3000 True))
  , test "filter long list"                                         (assertEq (ListOps.filter isOdd (replicate 5000 1)) (replicate 5000 1))
  , test "length long list"                                         (assertEq (ListOps.length (replicate 7000 True)) 7000)
  , test "map long list"                                            (assertEq (ListOps.map plusOne (replicate 5000 3)) (replicate 5000 4))
  , test "foldl long list"                                          (assertEq (ListOps.foldl (+) 0 (replicate 8000 1)) 8000)
  , test "foldr long list"                                          (assertEq (ListOps.foldr (+) 0 (replicate 3000 1)) 3000)
  , test "reverse long list"                                        (assertEq (ListOps.reverse (replicate 9000 0)) (replicate 9000 0))
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
