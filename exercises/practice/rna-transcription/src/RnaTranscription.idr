module RnaTranscription

import Data.Vect

%default total

namespace DnaNucleotide
  public export
  data DnaNucleotide = Foo

namespace RnaNucleotide
  public export
  data RnaNucleotide = Bar

export
implementation Eq RnaNucleotide where
  (==) x y = ?RnaNucleotideEqRhs

export
implementation Show RnaNucleotide where
  show x = ?RnaNucleotideShowRhs

export
toRna : Vect n DnaNucleotide -> Vect n RnaNucleotide
toRna = ?toRna_rhs
