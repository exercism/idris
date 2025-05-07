module NucleotideCount

public export
record DNA where
    constructor MkDNA
    adenine, cytosine, guanine, thymine : Nat

export
nucleotideCounts : String -> Maybe DNA
nucleotideCounts strand = ?nucleotideCounts_rhs
