module BookStore

import Data.Fin
import Data.List
import Data.Linear.Array

-- Linear array basics:
--   (1 _ : LinArray t) means the array must be used exactly once.
--   Each operation (mread, write) consumes the array and returns a fresh
--   one via `Res`: (value # arr') = mread arr idx. We thread the new
--   name (arr', arr'', ...) forward; reusing the old name is a
--   compile-time error. `read` also consumes the array but does NOT
--   return it, so use it only for the final read.
--   `newArray size $ \arr => ...` allocates via continuation-passing
--   because the array only exists within the callback's scope.

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

fill : (1 _ : LinArray Nat) -> Int -> LinArray Nat
fill arr idx =
  if idx < 0 then arr
  else let (_ # arr') = write arr idx 0
       in fill arr' (idx - 1)

tallyLoop : (1 _ : LinArray Nat) -> List (Fin 6) -> LinArray Nat
tallyLoop arr [] = arr
tallyLoop arr (idx :: rest) =
  let i = cast (finToNat idx)
      -- mread consumes arr and returns (value # fresh array) via Res
      (Just val # arr') = mread arr i
        | (Nothing # arr') => tallyLoop arr' rest
      (_ # arr'') = write arr' i (S val)
  in tallyLoop arr'' rest

-- A linear array must be consumed exactly once. When we're done with it,
-- `read` consumes the array as a side effect; we ignore the value returned.
discardArray : (1 _ : LinArray Nat) -> List Nat -> List Nat
discardArray arr acc = case read arr 0 of
                         Just _ => acc
                         Nothing => acc

-- Uses an accumulator because we can't build cons cells (val :: recursive call)
-- while holding a linear resource — Idris requires the array to be consumed
-- before the result is used in a non-linear context like List's (::).
readOutAcc : (1 _ : LinArray Nat) -> Int -> Int -> List Nat -> List Nat
readOutAcc arr idx end acc =
  let (mval # arr') = mread arr idx
      val = fromMaybe 0 mval
  in if idx >= end
     then discardArray arr' (reverse (val :: acc))
     else readOutAcc arr' (idx + 1) end (val :: acc)

computeTally : List (Fin 6) -> List Nat
computeTally items =
  newArray 6 $ \arr =>
    let arr1 = fill arr 5
        arr2 = tallyLoop arr1 items
    in readOutAcc arr2 1 5 []

export
price : List (Fin 6) -> Nat
price = applyDiscounts . adjust . differences . List.sort . computeTally
