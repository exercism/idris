module Hamming

import Data.Vect

public export
data Nucleotide = A | C | G | T

public export
implementation Eq Nucleotide where
  n1 == n2 = ?eq_nucleotide

export
hamming_distance : Vect n Nucleotide -> Vect n Nucleotide -> Nat
hamming_distance s1 s2 = ?hamming_distance
