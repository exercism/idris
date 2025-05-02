module ListOps

export
append : List a -> List a -> List a
append [] list2 = list2
append (first :: rest) list2 = first :: (append rest list2)

export
concat : List (List a) -> List a
concat [] = []
concat (first :: rest) = append first (concat rest)

export
filter : (a -> Bool) -> List a -> List a
filter predicate [] = []
filter predicate (first :: rest) = if predicate first
                                   then first :: (ListOps.filter predicate rest)
                                   else ListOps.filter predicate rest

export
length : List a -> Nat
length [] = 0
length (first :: rest) = S (ListOps.length rest)

export
map : (a -> b) -> List a -> List b
map function [] = []
map function (first :: rest) = (function first) :: (map function rest)

export
foldl : (a -> e -> a) -> a -> List e -> a
foldl function acc [] = acc
foldl function acc (first :: rest) = ListOps.foldl function (function acc first) rest

export
foldr : (a -> e -> a) -> a -> List e -> a
foldr function acc [] = acc
foldr function acc (first :: rest) = function (ListOps.foldr function acc rest) first

export
reverse : List a -> List a
reverse xs = loop xs []
  where loop : List a -> List a -> List a
        loop [] list2 = list2
        loop (first :: rest) list2 = loop rest (first :: list2)
