module Knapsack

import Data.Linear.Array

-- Linear array basics:
--   (1 _ : LinArray t) means the array must be used exactly once.
--   Each operation (mread, write) consumes the array and returns a fresh
--   one via `Res`: (value # arr') = mread arr idx. We thread the new
--   name (arr', arr1, arr2...) forward; reusing the old name is a
--   compile-time error. `read` also consumes the array but does NOT
--   return it, so use it only for the final read.
--   `newArray size $ \arr => ...` allocates via continuation-passing
--   because the array only exists within the callback's scope.

public export
record Item where
  constructor MkItem
  weight : Int
  value : Int

export
item : Int -> Int -> Item
item weight value = MkItem weight value

fill : (1 _ : LinArray Int) -> Int -> LinArray Int
fill arr idx =
  if idx < 0 then arr
  else let (_ # arr') = write arr idx 0 -- write returns (Bool # arr'); we discard the Bool
       in fill arr' (idx - 1)

-- Process one item across all weight capacities. Iterates w from maxW
-- down to item.weight so that each cell is updated using values from
-- the previous DP row (not yet overwritten in this pass).
updateWeights : Item -> Int -> (1 _ : LinArray Int) -> LinArray Int
updateWeights itm w arr =
  if w < itm.weight then arr
  else let (Just skipVal # arr1) = mread arr w
            | (Nothing # arr1) => updateWeights itm (w - 1) arr1
           (Just subVal # arr2) = mread arr1 (w - itm.weight)
            | (Nothing # arr2) => updateWeights itm (w - 1) arr2
           (_ # arr3) = write arr2 w (max skipVal (itm.value + subVal))
       in updateWeights itm (w - 1) arr3

processItems : Int -> (1 _ : LinArray Int) -> List Item -> LinArray Int
processItems maxW arr [] = arr
processItems maxW arr (itm :: rest) =
  processItems maxW (updateWeights itm maxW arr) rest

export
maximumValue : Int -> List Item -> Int
maximumValue maxW items =
  newArray (maxW + 1) $ \arr =>
    let arr1 = fill arr maxW
        arr2 = processItems maxW arr1 items
    in case read arr2 maxW of
         Just v  => v
         Nothing => 0
