module Bob

import Data.String

export
response : String -> String
response heyBob = if (trimmed == "") then "Fine. Be that way!" else answer isYell isQuestion
  where trimmed = trim heyBob
        isYell = (heyBob == toUpper heyBob) && (heyBob /= toLower heyBob)
        isQuestion = isSuffixOf "?" trimmed
        answer : Bool -> Bool -> String
        answer False False = "Whatever."
        answer False True  = "Sure."
        answer True  False = "Whoa, chill out!"
        answer True  True  = "Calm down, I know what I'm doing!"
