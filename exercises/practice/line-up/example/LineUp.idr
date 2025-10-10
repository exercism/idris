module LineUp

suffix : Int -> Int -> String
suffix 1 _ = "th"
suffix _ 1 = "st"
suffix _ 2 = "nd"
suffix _ 3 = "rd"
suffix _ _ = "th"

export
format : String -> Int -> String
format name number =
  name ++ ", you are the " ++ (show number) ++ (suffix (number `div` 10 `mod` 10) (number `mod` 10)) ++ " customer we serve today. Thank you!"
