module Test.Isogram

import Test.Assertions
import System

import Isogram

collect : {default 0 acc : Nat} -> (List (IO Bool)) -> IO Nat
collect {acc} []              = pure acc
collect {acc} (test :: tests) = do
    bool <- test
    case bool of
        True  => collect {acc=acc}   tests
        False => collect {acc=S acc} tests

export
runTests : IO ()
runTests = do
    count <- collect
        [ assertEquals (isogram "")                        True
        , assertEquals (isogram "isogram")                 True
        , assertEquals (isogram "eleven")                  False
        , assertEquals (isogram "subdermatoglyphic")       True
        , assertEquals (isogram "Alphabet")                False 
        , assertEquals (isogram "thumbscrew-japingly")     True
        , assertEquals (isogram "six-year-old")            True
        , assertEquals (isogram "Emily Jung Schwartzkopf") True
        , assertEquals (isogram "accentor")                False
        ]
    case count of
        Z => exitSuccess
        _ => exitFailure
