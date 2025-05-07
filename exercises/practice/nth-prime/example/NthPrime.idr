module NthPrime

import Data.Stream

difference : Stream Nat -> Stream Nat -> Stream Nat
difference (x :: xs) (y :: ys) = if x < y then x :: (difference xs (y :: ys))
                                 else if x == y then difference xs ys
                                 else difference (x :: xs) ys

union : Stream Nat -> Stream Nat -> Stream Nat
union (x :: xs) (y :: ys) = if x < y then x :: (union xs (y :: ys))
                            else if x == y then x :: (union xs ys)
                            else y :: (union (x :: xs) ys)

unionAll : Stream (Stream Nat) -> Stream Nat
unionAll ((x :: xs) :: yss) = x :: (union xs (unionAll yss))

filter : (Nat -> Bool) -> Stream Nat -> Stream Nat
filter p (x :: xs) = if p x then x :: (filter p xs)
                     else filter p xs

multiples : Nat -> Stream Nat
multiples p = iterate (\n => n + 2 * p) (p * p)

map : (a -> b) -> Stream a -> Stream b
map f (first :: rest) = (f first) :: (map f rest)

oddsFrom5 : Stream Nat
oddsFrom5 = iterate (\n => n + 2) 5

oddPrimes : Stream Nat
oddPrimes = 3 :: difference oddsFrom5 (unionAll (map multiples oddPrimes))

primes : Stream Nat
primes = 2 :: oddPrimes

export
prime : Nat -> Nat
prime 0 = 1
prime (S k) = index k primes
