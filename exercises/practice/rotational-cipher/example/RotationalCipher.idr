module RotationalCipher

import Data.Bits

export
rotate : String -> Int -> String
rotate text shiftKey = pack $ map rotateChar $ unpack text
  where rotateLetter : Int -> Int
        rotateLetter letter = (letter .&. 32) .|. (65 + mod ((letter .|. 32) - 97 + shiftKey) 26)
        rotateChar : Char -> Char
        rotateChar ch = if isAlpha ch then chr $ rotateLetter $ ord ch
                                      else ch
