module ListOps

export
append : List a -> List a -> List a
append list1 list2 = ?append_rhs

export
concat : List (List a) -> List a
concat lists = ?concat_rhs

export
filter : (a -> Bool) -> List a -> List a
filter predicate list = ?filter_rhs

export
length : List a -> Nat
length list = ?length_rhs

export
map : (a -> b) -> List a -> List b
map function list = ?map_rhs

export
foldl : (a -> e -> a) -> a -> List e -> a
foldl function initial list = ?foldl_rhs

export
foldr : (a -> e -> a) -> a -> List e -> a
foldr function initial list = ?foldr_rhs

export
reverse : List a -> List a
reverse list = ?reverse_rhs
