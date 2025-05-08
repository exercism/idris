module NucleotideCount

public export
record DNA where
    constructor MkDNA
    adenine, cytosine, guanine, thymine : Nat

export
nucleotideCounts : String -> Maybe DNA
nucleotideCounts = tally (MkDNA 0 0 0 0) . unpack
  where tally : DNA -> List Char -> Maybe DNA
        tally dna [] = Just dna
        tally dna ('A' :: rest) = tally ({ adenine $= (+ 1) } dna) rest
        tally dna ('C' :: rest) = tally ({ cytosine $= (+ 1) } dna) rest
        tally dna ('G' :: rest) = tally ({ guanine $= (+ 1) } dna) rest
        tally dna ('T' :: rest) = tally ({ thymine $= (+ 1) } dna) rest
        tally _ _ = Nothing
