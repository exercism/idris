module LargestSeriesProduct

public export
data Error = StringContainsNonDigit | SpanExceedsStringLength

export
largestProduct : String -> Nat -> Either Error Int
largestProduct digits span = ?largestProduct_rhs
