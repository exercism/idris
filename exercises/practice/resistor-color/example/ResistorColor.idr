module ResistorColor

import Data.Maybe
import Data.Vect

export
colors : Vect 10 String
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
colorCode : String -> Fin 10
colorCode color = fromMaybe 0 $ elemIndex color colors
