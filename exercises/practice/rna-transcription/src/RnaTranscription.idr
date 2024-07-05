module RnaTranscription

import Data.Vect

%default total

namespace DnaStrand
  public export
  data DnaStrand = Foo

namespace RnaStrand 
  public export
  data RnaStrand = Bar

export
implementation Eq RnaStrand where
  (==) x y = ?RnaStrandEqRhs

export
toRna : Vect n DnaStrand -> Vect n RnaStrand
toRna = ?toRna_rhs
