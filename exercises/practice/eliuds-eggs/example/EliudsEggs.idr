module EliudsEggs

import Data.Bits

export
eggCount : Int -> Int
eggCount number = loop number 0
  where loop : Int -> Int -> Int
        loop 0 count = count
        loop n count = loop (n - (n .&. -n)) (count + 1)
