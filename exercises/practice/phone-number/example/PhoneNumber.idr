module PhoneNumber

export
clean : String -> Maybe String
clean = validate . pack . dropOne . filter (\ch => ch >= '0') . unpack
  where isValid : List Char -> Nat -> Bool
        isValid [] n = n == 10
        isValid (first :: rest) n = (first >= '0') && (((n /= 0) && (n /= 3)) || (first >= '2')) && (first <= '9') && (isValid rest (S n))
        validate : String -> Maybe String
        validate phrase = if isValid (unpack phrase) 0 then Just phrase
                          else Nothing
        dropOne : List Char -> List Char
        dropOne ('1' :: rest) = rest
        dropOne other = other
