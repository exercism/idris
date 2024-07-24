module Grains

import Data.Bits

export
grains : Integer -> Maybe Integer
grains square = if (square < 1 || square > 64) then Nothing
                else Just $ bit $ cast $ square - 1

export
totalGrains : Integer
totalGrains = 0xffffffffffffffff
