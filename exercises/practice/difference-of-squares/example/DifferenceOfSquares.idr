module DifferenceOfSquares

export
squareOfSum : Integer -> Integer
squareOfSum number = square sum
  where sum = div (number * (number + 1)) 2
        square n = n * n

export
sumOfSquares : Integer -> Integer
sumOfSquares number = div (number * (number + 1) * (number + number + 1)) 6

export
differenceOfSquares : Integer -> Integer
differenceOfSquares number = (squareOfSum number) - (sumOfSquares number)
