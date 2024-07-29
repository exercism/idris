module Knapsack

public export
record Item where
  constructor MkItem
  weight : Int
  value : Int

export
item : Int -> Int -> Item
item weight value = MkItem weight value

export
maximumValue : Int -> List Item -> Int
maximumValue maximumWeight [] = 0
maximumValue maximumWeight (item :: remainingItems) =
  if item.weight > maximumWeight then maximumValue maximumWeight remainingItems
  else max (maximumValue maximumWeight remainingItems) (item.value + (maximumValue (maximumWeight - item.weight) remainingItems))
