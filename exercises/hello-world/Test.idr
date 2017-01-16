module Test

import HelloWorld

%access export

assertEq : Eq a => (given : a) -> (expected : a) -> IO ()
assertEq g e = putStrLn $ if g == e
                             then "Test Passed"
                             else "Test Failed"

testNothing : IO ()
testNothing = assertEq (greet Nothing) "Hello, World!"

testJustAlice : IO ()
testJustAlice = assertEq (greet (Just "Alice")) "Hello, Alice!"

testJustBob : IO ()
testJustBob = assertEq (greet (Just "Bob")) "Hello, Bob!"
