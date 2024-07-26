module RnaTranscription

import Data.Vect

%default total

namespace DnaStrand
  public export
  data DnaStrand = A | C | T | G

namespace RnaStrand
  public export
  data RnaStrand = A | C | G | U

export
implementation Eq RnaStrand where
  (==) A A = True
  (==) C C = True
  (==) G G = True
  (==) U U = True
  (==) _ _ = False

export
implementation Show RnaStrand where
  show A = "A"
  show C = "C"
  show G = "G"
  show U = "U"

export
toRna : Vect n DnaStrand -> Vect n RnaStrand
toRna [] = []
toRna (A :: xs) = U :: toRna xs
toRna (C :: xs) = G :: toRna xs
toRna (T :: xs) = A :: toRna xs
toRna (G :: xs) = C :: toRna xs
