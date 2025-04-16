module RomanNumerals

export
roman : Integer -> String
roman number = (thousands number) ++ (hundreds number) ++ (tens number) ++ (units number)
  where expand ten five one digit = if digit == 9 then one ++ ten
                                    else if digit == 4 then one ++ five
                                    else if digit >= 5 then five ++ (expand ten five one (digit - 5))
                                    else if digit >= 1 then one ++ (expand ten five one (digit - 1))
                                    else ""
        thousands : Integer -> String
        thousands number = expand "_" "_" "M" (number `div` 1000)
        hundreds : Integer -> String
        hundreds number = expand "M" "D" "C" (number `div` 100 `mod` 10)
        tens : Integer -> String
        tens number = expand "C" "L" "X" (number `div` 10 `mod` 10)
        units : Integer -> String
        units number = expand "X" "V" "I" (number `mod` 10)
