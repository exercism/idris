module Main

import System
import Tester
import Tester.Runner

import Hamming
import Data.Vect

tests : List Test
tests =
  [ test "empty strands"                   (assertEq (hamming_distance (the (Vect 0 Nucleotide) []) (the (Vect 0 Nucleotide) [])) 0)
  , test "single letter identical strands" (assertEq (hamming_distance [A] [A]) 0)
  , test "single letter different strands" (assertEq (hamming_distance [G] [T]) 1)
  , test "long identical strands"          (assertEq (hamming_distance [G, G, A, C, T, G, A, A, A, T, C, T, G] [G, G, A, C, T, G, A, A, A, T, C, T, G]) 0)
  , test "long different strands"          (assertEq (hamming_distance [G, G, A, C, G, G, A, T, T, C, T, G] [A, G, G, A, C, G, G, A, T, T, C, T]) 9)
  , test "short identical strands"         (assertEq (hamming_distance [G, G, A, C, T, G, A] [G, G, A, C, T, G, A]) 0)
  , test "short different strands"         (assertEq (hamming_distance [A, C, C, A, G, G, G] [A, C, T, A, T, G, G]) 2)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
