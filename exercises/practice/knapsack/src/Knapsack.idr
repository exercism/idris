module Knapsack

public export
record Item where
  constructor MkItem
  weight : Int
  value : Int

export
item : Int -> Int -> Item
item weight value = ?item_rhs

export
maximumValue : Int -> List Item -> Int
maximumValue maximumWeight items = ?maximumValue_rhs
