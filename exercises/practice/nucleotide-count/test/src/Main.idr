module Main

import System
import Tester
import Tester.Runner

import NucleotideCount

export
implementation Eq DNA where
  (==) (MkDNA a1 c1 g1 t1) (MkDNA a2 c2 g2 t2) = (a1 == a2) && (c1 == c2) && (g1 == g2) && (t1 == t2)

export
implementation Show DNA where
  show (MkDNA a c g t) = "(MkDNA " ++ (show a) ++ " " ++ (show c) ++ " " ++ (show g) ++ " " ++ (show t) ++ ")"

tests : List Test
tests =
  [ test "empty strand"                                       (assertEq (nucleotideCounts "") $ Just $ MkDNA 0 0 0 0)
  , test "can count one nucleotide in single-character input" (assertEq (nucleotideCounts "G") $ Just $ MkDNA 0 0 1 0)
  , test "strand with repeated nucleotide"                    (assertEq (nucleotideCounts "GGGGGGG") $ Just $ MkDNA 0 0 7 0)
  , test "strand with multiple nucleotides"                   (assertEq (nucleotideCounts "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC") $ Just $ MkDNA 20 12 17 21)
  , test "strand with invalid nucleotides"                    (assertEq (nucleotideCounts "AGXXACT") $ Nothing)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
