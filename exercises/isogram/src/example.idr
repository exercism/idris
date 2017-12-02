module Isogram

export
isogram : String -> Bool
isogram s = let abc = filter (\x => elem x ['a'..'z']) $ map toLower $ unpack s
              in abc == nub abc
