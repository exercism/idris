module RnaTranscription

import Data.Vect

%default total

namespace DnaNucleotide
  public export
  data DnaNucleotide = A | C | T | G

namespace RnaNucleotide
  public export
  data RnaNucleotide = A | C | G | U

export
implementation Eq RnaNucleotide where
  (==) A A = True
  (==) C C = True
  (==) G G = True
  (==) U U = True
  (==) _ _ = False

export
implementation Show RnaNucleotide where
  show A = "A"
  show C = "C"
  show G = "G"
  show U = "U"

export
toRna : Vect n DnaNucleotide -> Vect n RnaNucleotide
toRna [] = []
toRna (A :: xs) = U :: toRna xs
toRna (C :: xs) = G :: toRna xs
toRna (T :: xs) = A :: toRna xs
toRna (G :: xs) = C :: toRna xs
