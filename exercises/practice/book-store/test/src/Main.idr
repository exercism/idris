module Main

import System
import Tester
import Tester.Runner

import BookStore
import Data.Fin

tests : List Test
tests =
  [ test "Only a single book"                                                                                          (assertEq (price [1]) $ 800)
  , test "Two of the same book"                                                                                        (assertEq (price [2, 2]) $ 1600)
  , test "Empty basket"                                                                                                (assertEq (price (the (List (Fin 6)) [])) $ 0)
  , test "Two different books"                                                                                         (assertEq (price [1, 2]) $ 1520)
  , test "Three different books"                                                                                       (assertEq (price [1, 2, 3]) $ 2160)
  , test "Four different books"                                                                                        (assertEq (price [1, 2, 3, 4]) $ 2560)
  , test "Five different books"                                                                                        (assertEq (price [1, 2, 3, 4, 5]) $ 3000)
  , test "Two groups of four is cheaper than group of five plus group of three"                                        (assertEq (price [1, 1, 2, 2, 3, 3, 4, 5]) $ 5120)
  , test "Two groups of four is cheaper than groups of five and three"                                                 (assertEq (price [1, 1, 2, 3, 4, 4, 5, 5]) $ 5120)
  , test "Group of four plus group of two is cheaper than two groups of three"                                         (assertEq (price [1, 1, 2, 2, 3, 4]) $ 4080)
  , test "Two each of first four books and one copy each of rest"                                                      (assertEq (price [1, 1, 2, 2, 3, 3, 4, 4, 5]) $ 5560)
  , test "Two copies of each book"                                                                                     (assertEq (price [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]) $ 6000)
  , test "Three copies of first book and two each of remaining"                                                        (assertEq (price [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1]) $ 6800)
  , test "Three each of first two books and two each of remaining books"                                               (assertEq (price [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2]) $ 7520)
  , test "Four groups of four are cheaper than two groups each of five and three"                                      (assertEq (price [1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5]) $ 10240)
  , test "Check that groups of four are created properly even when there are more groups of three than groups of five" (assertEq (price [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5]) $ 14560)
  , test "One group of one and four is cheaper than one group of two and three"                                        (assertEq (price [1, 1, 2, 3, 4]) $ 3360)
  , test "One group of one and two plus three groups of four is cheaper than one group of each size"                   (assertEq (price [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5]) $ 10000)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
