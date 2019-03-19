module Hamming

import Data.Vect

public export
data Nucleotide = A | C | G | T

public export
implementation Eq Nucleotide where
  A == A = True
  C == C = True
  G == G = True
  T == T = True
  _ == _ = False

export
hamming_distance : Vect n Nucleotide -> Vect n Nucleotide -> Nat
hamming_distance s1 s2 = fst $ Data.Vect.filter (uncurry (/=)) $ zip s1 s2
