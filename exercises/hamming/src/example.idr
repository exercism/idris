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
hamming_distance : Eq a => Vect n a -> Vect n a -> Nat
hamming_distance s1 s2 = 
  fst $ filter ((/=) 0) $ map (\(n1,n2) => if n1 == n2 then 0 else 1) $ zip s1 s2