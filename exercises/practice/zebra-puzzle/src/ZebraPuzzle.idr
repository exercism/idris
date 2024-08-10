module ZebraPuzzle

public export
data Nationality = Englishman | Japanese | Norwegian | Spaniard | Ukrainian

public export
record Solution where
  constructor MkSolution
  drinksWater : Nationality
  ownsZebra : Nationality

export
solution : Solution
solution = ?solution_rhs
