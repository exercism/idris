module KindergartenGarden

import Data.Vect

public export
data Plant = Grass | Clover | Radishes | Violets

export
plants : String -> String -> Maybe (Vect 4 Plant)
plants diagram student = ?plants_rhs
