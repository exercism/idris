module GameOfLife

import Data.Fin
import Data.Vect

vmap : (a -> b) -> Vect n a -> Vect n b
vmap _ [] = []
vmap f (hd :: tl) = (f hd) :: (vmap f tl)

sum3 : Vect n Nat -> Vect n Nat
sum3 [] = []
sum3 (hd :: tl) = loop 0 hd tl
  where loop : Nat -> Nat -> Vect m Nat -> Vect (S m) Nat
        loop previous current [] = [previous + current]
        loop previous current (next :: rest) = (previous + current + next) :: (loop current next rest)

sum9 : (rows : Nat) -> (columns : Nat) -> Vect rows (Vect columns (Fin 2)) -> Vect rows (Vect columns Nat)
sum9 rows columns = transpose . (vmap sum3) . transpose . (vmap (sum3 . (vmap finToNat)))

update : Fin 2 -> Nat -> Fin 2
update 1 3 = 1 -- Any live cell with two live neighbors lives on.
update 1 4 = 1 -- Any live cell with three live neighbors lives on.
update 0 3 = 1 -- Any dead cell with exactly three live neighbors becomes a live cell.
update _ _ = 0 -- All other cells die or stay dead.

export
tick : (rows : Nat) -> (columns : Nat) -> Vect rows (Vect columns (Fin 2)) -> Vect rows (Vect columns (Fin 2))
tick rows columns matrix = zipWith (zipWith update) matrix (sum9 rows columns matrix)
