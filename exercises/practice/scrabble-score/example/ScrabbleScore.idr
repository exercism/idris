module ScrabbleScore

import Data.String

export
score : String -> Int
score = sum . map letterScore . unpack . toUpper
  where letterScore : Char -> Int
        letterScore 'A' = 1
        letterScore 'E' = 1
        letterScore 'I' = 1
        letterScore 'O' = 1
        letterScore 'U' = 1
        letterScore 'L' = 1
        letterScore 'N' = 1
        letterScore 'R' = 1
        letterScore 'S' = 1
        letterScore 'T' = 1
        letterScore 'D' = 2
        letterScore 'G' = 2
        letterScore 'B' = 3
        letterScore 'C' = 3
        letterScore 'M' = 3
        letterScore 'P' = 3
        letterScore 'F' = 4
        letterScore 'H' = 4
        letterScore 'V' = 4
        letterScore 'W' = 4
        letterScore 'Y' = 4
        letterScore 'K' = 5
        letterScore 'J' = 8
        letterScore 'X' = 8
        letterScore 'Q' = 10
        letterScore 'Z' = 10
        letterScore _ = 0
