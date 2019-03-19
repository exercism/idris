module RnaTranscription

import Data.Vect

namespace DnaStrand
  public export
  data DnaStrand = A | C | G | T

  public export
  implementation Show DnaStrand where
    show A = "A"

  public export
  implementation Eq DnaStrand where
    A == A = True
    C == C = True
    G == G = True
    T == T = True
    _ == _ = False

namespace RnaStrand
  public export
  data RnaStrand = U | G | C | A

  public export
  implementation Show RnaStrand where
    show A = "A"

  public export
  implementation Eq RnaStrand where
    U == U = True
    G == G = True
    C == C = True
    A == A = True
    _ == _ = False


export
toRna : Vect n DnaStrand -> Vect n RnaStrand
toRna = map transmute
  where
    transmute : DnaStrand -> RnaStrand
    transmute A = U
    transmute C = G
    transmute G = C
    transmute T = A
