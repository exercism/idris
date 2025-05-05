module BinarySearch

import Data.Vect

export
find : Ord a => (n: Nat) -> Vect n a -> a -> Maybe (Fin n)
find n array value = findIndex (\element => element == value) array
