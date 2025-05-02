module KindergartenGarden

import Data.Maybe
import Data.List
import Data.Vect

public export
data Plant = Grass | Clover | Radishes | Violets

check : Vect 4 (Maybe Plant) -> Maybe (Vect 4 Plant)
check [Just first, Just second, Just third, Just fourth] = Just [first, second, third, fourth]
check _ = Nothing

lookupPlants : String -> Maybe (Vect 4 Nat) -> Vect 4 (Maybe Plant)
lookupPlants _ Nothing = [Nothing, Nothing, Nothing, Nothing]
lookupPlants diagram (Just indices) = map lookupPlant indices
  where toPlant : List Char -> Maybe Plant
        toPlant ('G' :: _) = Just Grass
        toPlant ('C' :: _) = Just Clover
        toPlant ('R' :: _) = Just Radishes
        toPlant ('V' :: _) = Just Violets
        toPlant _ = Nothing
        lookupPlant : Nat -> Maybe Plant
        lookupPlant index = toPlant (drop index $ unpack diagram)

plantIndices : Nat -> Maybe Nat -> Maybe (Vect 4 Nat)
plantIndices diagramLen (Just studentIdx) = Just [
                                                2 * studentIdx,
                                                2 * studentIdx + 1,
                                                diagramLen `div` 2 + 2 * studentIdx + 1,
                                                diagramLen `div` 2 + 2 * studentIdx + 2
                                            ]
plantIndices diagramLen _ = Nothing

studentIndex : String -> Maybe Nat
studentIndex "Alice" = Just 0
studentIndex "Bob" = Just 1
studentIndex "Charlie" = Just 2
studentIndex "David" = Just 3
studentIndex "Eve" = Just 4
studentIndex "Fred" = Just 5
studentIndex "Ginny" = Just 6
studentIndex "Harriet" = Just 7
studentIndex "Ileana" = Just 8
studentIndex "Joseph" = Just 9
studentIndex "Kincaid" = Just 10
studentIndex "Larry" = Just 11
studentIndex _ = Nothing

export
plants : String -> String -> Maybe (Vect 4 Plant)
plants diagram student = check $ lookupPlants diagram $ plantIndices (length diagram) $ studentIndex student
