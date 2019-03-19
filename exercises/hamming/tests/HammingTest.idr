import Specdris.Spec

import Data.Vect

import Hamming

main : IO ()
main = let empty = the (Vect _ Nucleotide) [] in spec $ do
  it "distance of A and A is 0"                       $ hamming_distance [A]                       [A]                       === 0
  it "distance of GGACTGA and GGCTGA is 0"            $ hamming_distance [G,G,A,C,T,G,A]           [G,G,A,C,T,G,A]           === 0
  it "distance of A and G is 1"                       $ hamming_distance [A]                       [G]                       === 1
  it "distance of AG and CT is 2"                     $ hamming_distance [A,G]                     [C,T]                     === 2
  it "distance of AT and CT is 1"                     $ hamming_distance [A,T]                     [C,T]                     === 1
  it "distance of GGACG and GGTCG is 1"               $ hamming_distance [G,G,A,C,G]               [G,G,T,C,G]               === 1
  it "distance of ACCAGGG and ACTATGG is 2"           $ hamming_distance [A,C,C,A,G,G,G]           [A,C,T,A,T,G,G]           === 2
  it "distance of AGA and AGG is 1"                   $ hamming_distance [A,G,A]                   [A,G,G]                   === 1
  it "distance of AGG and AGA is 1"                   $ hamming_distance [A,G,G]                   [A,G,A]                   === 1
  it "distance of TAG and GAT is 2"                   $ hamming_distance [T,A,G]                   [G,A,T]                   === 2
  it "distance of GATACA and GCATAA is 4"             $ hamming_distance [G,A,T,A,C,A]             [G,C,A,T,A,A]             === 4
  it "distance of GGACGGATTCTG and AGGACGGATTCT is 9" $ hamming_distance [G,G,A,C,G,G,A,T,T,C,T,G] [A,G,G,A,C,G,G,A,T,T,C,T] === 9
  it "distnace of 2 empty strands is 0"               $ hamming_distance empty                     empty                     === 0
