module ResistorColorTrio

import Data.Vect

colorCode : String -> Maybe Integer
colorCode color = (Just $ cast) <*> (elemIndex color colors)
  where colors : Vect 10 String
        colors =
          [ "black"
          , "brown"
          , "red"
          , "orange"
          , "yellow"
          , "green"
          , "blue"
          , "violet"
          , "grey"
          , "white"
          ]

generateLabel: Integer -> Integer -> String
generateLabel value dividend = valueString ++ unitsString
  where quotient = div dividend 3
        remainder = mod dividend 3
        valueString = if remainder == 2 then show $ value * 10
                      else if remainder == 1 then show value
                      else if mod value 10 == 0 then show $ div value 10
                      else show $ (cast value) / 10.0
        unitsString = if quotient == 3 then " gigaohms"
                      else if quotient == 2 then " megaohms"
                      else if quotient == 1 then " kiloohms"
                      else " ohms"

export
label : Vect 3 String -> Maybe String
label (first :: second :: third :: nil) = do
  firstValue <- colorCode first;
  secondValue <- colorCode second;
  thirdValue <- colorCode third;
  Just $ generateLabel (firstValue * 10 + secondValue) (thirdValue + 1)
