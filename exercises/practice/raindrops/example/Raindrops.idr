module Raindrops

export
convert : Int -> String
convert number = let sounds = (sound "Pling" 3) ++ (sound "Plang" 5) ++ (sound "Plong" 7)
                 in if sounds == ""
                       then show number
                       else sounds
  where sound : String -> Int -> String
        sound name factor = if mod number factor == 0
                               then name
                               else ""
