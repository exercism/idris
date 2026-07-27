module Acronym

import Data.String

process : Bool -> List Char -> List Char
process _ [] = []
process False (first :: rest) = if isAlpha first
                                then first :: (process True rest)  -- start of word
                                else process False rest
process True (first :: rest) = if first == ' ' || first == '-'
                               then process False rest  -- end of word
                               else process True rest

export
abbreviate : String -> String
abbreviate = pack . (process False) . unpack . toUpper
