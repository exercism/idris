module RnaTranscription

import Data.Vect

%access export
%default total

namespace DnaStrand
  public export
  data DnaStrand

namespace RnaStrand 
  public export
  data RnaStrand

toRna : Vect n DnaStrand -> Vect n RnaStrand
toRna = ?toRna_rhs
