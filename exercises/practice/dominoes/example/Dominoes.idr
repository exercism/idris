module Dominoes

import Data.List
import Data.Vect

vmap : (a -> b) -> Vect n a -> Vect n b
vmap _ [] = []
vmap f (first :: rest) = (f first ) :: (vmap f rest)

computeTally : List (Vect 2 (Fin 7)) -> Vect 7 Nat
computeTally = loop (replicate 7 (the Nat 0))
  where loop : Vect 7 Nat -> List (Vect 2 (Fin 7)) -> Vect 7 Nat
        loop tally [] = tally
        loop tally ((left :: right :: []) :: rest) = loop (updateAt left S (updateAt right S tally)) rest

-- Follow parent chain is Disjoint Set table
root : Vect 7 (Fin 7) -> Fin 7 -> Fin 7
root table i = if parent == i then i
               else root table parent
  where parent : Fin 7
        parent = index i table

-- Create Disjoint Set table
parents : List (Vect 2 (Fin 7)) -> Vect 7 (Fin 7)
parents dominoes = loop [0, 1, 2, 3, 4, 5, 6] dominoes
  where loop : Vect 7 (Fin 7) -> List (Vect 2 (Fin 7)) -> Vect 7 (Fin 7)
        loop table [] = table
        loop table ((left :: right :: []) :: rest) = loop (replaceAt (root table right) (root table left) table) rest

-- A number appearing on a domino
initial : List (Vect 2 (Fin 7)) -> Fin 7
initial [] = 0
initial ((left :: right :: []) :: rest) = left

export
canChain : List (Vect 2 (Fin 7)) -> Bool
canChain dominoes = (isNil dominoes) || (tallyAllEven && allConnected)
  where tally : Vect 7 Nat
        tally = computeTally dominoes
        onlyEven : Vect n Nat -> Bool
        onlyEven [] = True
        onlyEven (first :: rest) = (first `mod` 2 == 0) && (onlyEven rest)
        tallyAllEven = onlyEven tally
        dominoParents = parents dominoes
        dominoRoots = vmap (root dominoParents) dominoParents
        initialRoot = root dominoParents (initial dominoes)
        allConnected = find (\element => ((index element tally > 0) && (index element dominoRoots) /= initialRoot)) (the (List (Fin 7)) [0, 1, 2, 3, 4, 5, 6]) == Nothing
