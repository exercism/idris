module Test.Leap

import Test.Assertions
import System

import Leap

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
    count <- collect
        [ assertFalse (isLeap 2015)
        , assertTrue  (isLeap 2016)
        , assertFalse (isLeap 2100)
        , assertTrue  (isLeap 2000)
        , assertEquals version "1.0.0"
        ]
    case count of
        Z => exitSuccess
        _ => exitFailure
