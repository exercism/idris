module Hamming

import Data.Vect

-- Add the correct export modifier here...
data Nucleotide = A | C | G | T

-- Add the correct export modifier here...
hamming_distance : Vect n Nucleotide -> Vect n Nucleotide -> Nat
hamming_distance s1 s2 = ?hamming_distance_rhs