module BookStore

import Data.List
import Data.Vect

applyDiscounts : List Nat -> Nat
applyDiscounts (fives :: fours :: threes :: twos :: ones :: []) = 3000 * fives + 2560 * fours + 2160 * threes + 1520 * twos + 800 * ones
applyDiscounts _ = 0

adjust : List Nat -> List Nat
adjust (fives :: fours :: threes :: rest) = (minus fives adjustment) :: (fours + 2 * adjustment) :: (minus threes adjustment) :: rest
  where adjustment = minimum fives threes
adjust _ = []

differences : List Nat -> List Nat
differences = loop 0
  where loop : Nat -> List Nat -> List Nat
        loop _ [] = []
        loop previous (first :: rest) = (minus first previous) :: (loop first rest)

computeTally : List (Fin 6) -> Vect 5 Nat
computeTally = drop 1 . loop (replicate 6 (the Nat 0))
  where loop : Vect 6 Nat -> List (Fin 6) -> Vect 6 Nat
        loop tallies [] = tallies
        loop tallies (first :: rest) = loop (updateAt first S tallies) rest

export
price : List (Fin 6) -> Nat
price = applyDiscounts . adjust . differences . List.sort . toList . computeTally
