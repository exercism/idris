module Test.Hamming

import Data.Vect
import Test.Assertions
import System

import Hamming

collect : {default 0 acc : Nat} -> (List (IO Bool)) -> IO Nat
collect {acc} []               = pure acc
collect {acc} (test :: tests) = do
    bool <- test
    case bool of
        True  => collect {acc=acc}   tests
        False => collect {acc=S acc} tests

export
runTests : IO ()
runTests = do
    let empty = the (Vect _ Nucleotide) []
    count <- collect
        [ assertEquals (hamming_distance [A] [A]) 0
        , assertEquals (hamming_distance [G,G,A,C,T,G,A] [G,G,A,C,T,G,A]) 0
        , assertEquals (hamming_distance [A] [G]) 1
        , assertEquals (hamming_distance [A,G] [C,T]) 2
        , assertEquals (hamming_distance [A,T] [C,T]) 1
        , assertEquals (hamming_distance [G,G,A,C,G] [G,G,T,C,G]) 1
        , assertEquals (hamming_distance [A,C,C,A,G,G,G] [A,C,T,A,T,G,G]) 2
        , assertEquals (hamming_distance [A,G,A] [A,G,G]) 1
        , assertEquals (hamming_distance [A,G,G] [A,G,A]) 1
        , assertEquals (hamming_distance [T,A,G] [G,A,T]) 2
        , assertEquals (hamming_distance [G,A,T,A,C,A] [G,C,A,T,A,A]) 4
        , assertEquals (hamming_distance [G,G,A,C,G,G,A,T,T,C,T,G] [A,G,G,A,C,G,G,A,T,T,C,T]) 9
        , assertEquals (hamming_distance empty empty) 0
        , assertEquals version "1.0.0"
        ]
    case count of
        Z => exitSuccess
        _ => exitFailure
