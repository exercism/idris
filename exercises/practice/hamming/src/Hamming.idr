module Hamming

import Data.Vect

public export
data Nucleotide = A | C | G | T

public export
implementation Eq Nucleotide where
    l == r = ?eq_rhs

export
hamming_distance : Eq a => Vect n a -> Vect n a -> Nat
hamming_distance s1 s2 = ?hamming_distance_rhs
