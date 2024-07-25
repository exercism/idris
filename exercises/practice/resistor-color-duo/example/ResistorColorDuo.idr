module ResistorColorDuo

import Data.Fin
import Data.Vect

colorCode : String -> Maybe (Fin 100)
colorCode color = (Just $ weakenN 90) <*> (elemIndex color colors)
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

export
value : Vect 2 String -> Maybe (Fin 100)
value (first :: second :: nil) = do
  firstValue <- colorCode first;
  secondValue <- colorCode second;
  Just $ 10 * firstValue + secondValue
