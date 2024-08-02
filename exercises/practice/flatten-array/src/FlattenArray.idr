module FlattenArray

public export
data Tree a = Hollow | Leaf a | Branch (List (Tree a))

export
flatten : Tree a -> List a
flatten tree = ?flatten_rhs
