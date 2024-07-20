module CollatzConjecture

export
steps : Int -> Maybe Int
steps number = if number <= 0
                  then Nothing
                  else Just $ loop 0 number
  where loop : Int -> Int -> Int
        loop count 1 = count
        loop count n = loop (count + 1) $ if mod n 2 == 0
                                             then div n 2
                                             else 3 * n + 1
