module ResistorColor

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
colorCode : String -> Maybe (Fin 10)
colorCode color = elemIndex color colors
