module Test.Leap

import Leap

%access export

assertBool : Bool -> Bool -> IO ()
assertBool expected given = putStrLn $ if given == expected then "Test Passed" else "Test Failed"

assertTrue : Bool -> IO ()
assertTrue = assertBool True

assertFalse : Bool -> IO ()
assertFalse = assertBool False

-- year not divisible by 4: common year
test2015 : IO ()
test2015 = assertFalse (isLeap 2015)

-- year divisible by 4, not divisible by 100: leap year
test2016 : IO ()
test2016 = assertTrue (isLeap 2016)

-- year divisible by 100, not divisible by 400: common year
test2100 : IO ()
test2100 = assertFalse (isLeap 2100)

-- year divisible by 400: leap year
test2000 : IO ()
test2000 = assertTrue (isLeap 2000)

runTests : IO ()
runTests = do
    test2015
    test2016
    test2100
    test2000
