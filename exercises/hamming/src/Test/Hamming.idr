module Test.Hamming

import Data.Vect
import Hamming

%access export

assertEq : Eq a => (given : a) -> (expected : a) -> IO ()
assertEq g e = putStrLn $ if g == e then "Test Passed" else "Test Failed"

testIdenticalStrands : IO ()
testIdenticalStrands = assertEq (hamming_distance [A] [A]) 0

testLongIdenticalStrands : IO ()
testLongIdenticalStrands = assertEq (hamming_distance [G,G,A,C,T,G,A] [G,G,A,C,T,G,A]) 0

testDifferentSingleNucleotideStrands : IO ()
testDifferentSingleNucleotideStrands = assertEq (hamming_distance [A] [G]) 1

testMaximumDistanceInSmallNucleotideStrands : IO ()
testMaximumDistanceInSmallNucleotideStrands = assertEq (hamming_distance [A,G] [C,T]) 2

testSmallDifferenceInSmallNucleotideStrands : IO ()
testSmallDifferenceInSmallNucleotideStrands = assertEq (hamming_distance [A,T] [C,T]) 1

testSmallDistance : IO ()
testSmallDistance = assertEq (hamming_distance [G,G,A,C,G] [G,G,T,C,G]) 1

testSmallDistanceInLongStrands : IO ()
testSmallDistanceInLongStrands = assertEq (hamming_distance [A,C,C,A,G,G,G] [A,C,T,A,T,G,G]) 2

testNonUniqueCharacterInFirstStrand : IO ()
testNonUniqueCharacterInFirstStrand = assertEq (hamming_distance [A,G,A] [A,G,G]) 1

testNonUniqueCharacterInSecondStrand : IO ()
testNonUniqueCharacterInSecondStrand = assertEq (hamming_distance [A,G,G] [A,G,A]) 1

testSameNucleotidesInDifferentPositions : IO ()
testSameNucleotidesInDifferentPositions = assertEq (hamming_distance [T,A,G] [G,A,T]) 2

testLargeDistance : IO ()
testLargeDistance = assertEq (hamming_distance [G,A,T,A,C,A] [G,C,A,T,A,A]) 4

testLargeDistanceInOffByOneStrand : IO ()
testLargeDistanceInOffByOneStrand = assertEq (hamming_distance [G,G,A,C,G,G,A,T,T,C,T,G] [A,G,G,A,C,G,G,A,T,T,C,T]) 9

testEmptyStrands : IO ()
testEmptyStrands = 
    let empty = the (Vect _ Nucleotide) [] in
    assertEq (hamming_distance empty empty) 0

runTests : IO ()
runTests = do
    testIdenticalStrands
    testLongIdenticalStrands
    testDifferentSingleNucleotideStrands
    testMaximumDistanceInSmallNucleotideStrands
    testSmallDifferenceInSmallNucleotideStrands
    testSmallDistance
    testSmallDistanceInLongStrands
    testNonUniqueCharacterInFirstStrand
    testNonUniqueCharacterInSecondStrand
    testSameNucleotidesInDifferentPositions
    testLargeDistance
    testLargeDistanceInOffByOneStrand
    testEmptyStrands
