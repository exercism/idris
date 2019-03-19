module RnaTranscription

import Data.Vect

namespace DnaStrand
  public export
  data DnaStrand

  public export
  implementation Show DnaStrand where
    show x = ?show_dna_strand_rhs

  public export
  implementation Eq DnaStrand where
    l == r = ?eq_dna_strand_rhs

namespace RnaStrand
  public export
  data RnaStrand

  public export
  implementation Show RnaStrand where
    show x = ?show_rna_strand_rhs

  public export
  implementation Eq RnaStrand where
    l == r = ?eq_rna_strand_rhs

export
toRna : Vect n DnaStrand -> Vect n RnaStrand
toRna dna = ?toRna_rhs
