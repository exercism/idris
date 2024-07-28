module AllYourBase

public export
data Error = InvalidBase | InvalidDigit

export
rebase : Int -> List Int -> Int -> Either Error (List Int)
rebase inputBase digits outputBase = ?rebase_rhs
