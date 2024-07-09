module Main

import Data.Vect
import System
import Tester
import Tester.Runner

import Hamming

collect : {default 0 acc : Nat} -> (List (IO Bool)) -> IO Nat
collect {acc} []               = pure acc
collect {acc} (test :: tests) = do
    bool <- test
    case bool of
        True  => collect {acc=acc}   tests
        False => collect {acc=S acc} tests

tests : List Test
tests = map (test "")
        [ assertEq (hamming_distance [A] [A]) 0
        , assertEq (hamming_distance [G,G,A,C,T,G,A] [G,G,A,C,T,G,A]) 0
        , assertEq (hamming_distance [A] [G]) 1
        , assertEq (hamming_distance [A,G] [C,T]) 2
        , assertEq (hamming_distance [A,T] [C,T]) 1
        , assertEq (hamming_distance [G,G,A,C,G] [G,G,T,C,G]) 1
        , assertEq (hamming_distance [A,C,C,A,G,G,G] [A,C,T,A,T,G,G]) 2
        , assertEq (hamming_distance [A,G,A] [A,G,G]) 1
        , assertEq (hamming_distance [A,G,G] [A,G,A]) 1
        , assertEq (hamming_distance [T,A,G] [G,A,T]) 2
        , assertEq (hamming_distance [G,A,T,A,C,A] [G,C,A,T,A,A]) 4
        , assertEq (hamming_distance [G,G,A,C,G,G,A,T,T,C,T,G] [A,G,G,A,C,G,G,A,T,T,C,T]) 9
--        , assertEq (hamming_distance empty empty) 0
        ]
export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
