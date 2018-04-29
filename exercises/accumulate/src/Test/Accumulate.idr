module Test.Accumulate

import Accumulate

%access export

assertEq : Eq a => String -> (given : a) -> (expected : a) -> IO ()
assertEq label g e = putStrLn $ if g == e then label ++ ": Test Passed" else label ++ ": Test Failed"

testEmptyListDoesNothing : IO ()
testEmptyListDoesNothing = assertEq "empty list does nothing" (accumulate (\x => x) []) (the (List Int) [])

testIdentityFunctionDoesNothing : IO ()
testIdentityFunctionDoesNothing = assertEq "identity function does nothing" (accumulate (\x => x) [1,2,3]) [1,2,3]

testSquareFunctionDoublesInput : IO ()
testSquareFunctionDoublesInput = assertEq "square function doubles input" (accumulate (\x => x * x) [1,2,3]) [1,4,9]

testCubeFunctionTriplesInput : IO ()
testCubeFunctionTriplesInput = assertEq "cube function triples input" (accumulate (\x => x * x * x) [1,2,3]) [1,8,27]

testIncrementFunctionAddsOneToAllInput : IO ()
testIncrementFunctionAddsOneToAllInput = assertEq "increment function adds 1 to input" (accumulate (\x => x + 1) [1,2,3]) [2,3,4]

testDecrementFunctionAddsOneToAllInput : IO ()
testDecrementFunctionAddsOneToAllInput = assertEq "decrement function subtracts 1 from input" (accumulate (\x => x - 1) [1,2,3]) (the (List Int) [0,1,2])

runTests : IO ()
runTests = do
  testEmptyListDoesNothing
  testIdentityFunctionDoesNothing
  testSquareFunctionDoublesInput
  testCubeFunctionTriplesInput
  testIncrementFunctionAddsOneToAllInput
  testDecrementFunctionAddsOneToAllInput