module TwoFer

import Data.Maybe

export
twoFer : Maybe String -> String
twoFer name = "One for " ++ (fromMaybe "you" name) ++ ", one for me."
