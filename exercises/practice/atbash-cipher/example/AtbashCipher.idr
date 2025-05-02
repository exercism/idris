module AtbashCipher

import Data.List
import Data.Nat

encodeLetter : Char -> Char
encodeLetter ch = if isAlpha ch then chr $ 219 - (ord (toLower ch))
                  else ch

insertSpaces : List Char -> List Char
insertSpaces xs = if length xs <= 5 then xs
                  else (take 5 xs) ++ (' ' :: (insertSpaces (drop 5 xs)))

export
encode : String -> String
encode = pack . insertSpaces . (map encodeLetter) . (filter isAlphaNum) . unpack

export
decode : String -> String
decode = pack . (map encodeLetter) . (filter isAlphaNum) . unpack
