module GameOfLife

import Data.Vect

export
tick : (rows : Nat) -> (columns : Nat) -> Vect rows (Vect columns (Fin 2)) -> Vect rows (Vect columns (Fin 2))
tick rows columns matrix = ?tick_rhs
