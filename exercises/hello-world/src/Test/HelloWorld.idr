module Test.HelloWorld

import Test.Assertions
import System

import HelloWorld

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
        [ assertEquals hello   "Hello, World!"
        , assertEquals version "1.0.0"
        ]
    case count of
        Z => exitSuccess
        _ => exitFailure
