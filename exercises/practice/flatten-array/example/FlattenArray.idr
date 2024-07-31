module FlattenArray

public export
data Tree a = Hollow | Leaf a | Branch (List (Tree a))

export
flatten : Tree a -> List a
flatten Hollow = []
flatten (Leaf n) = [n]
flatten (Branch []) = []
flatten (Branch (x::xs)) = (flatten x) ++ (flatten (Branch xs))
