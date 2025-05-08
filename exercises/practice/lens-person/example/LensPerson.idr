module LensPerson

public export
record Address where
    constructor MkAddress
    street : String
    houseNumber : Int
    place : String
    country : String

public export
record Born where
    constructor MkBorn
    bornAt : Address
    bornOn : String

public export
record Person where
    constructor MkPerson
    name : String
    born : Born
    address : Address

export
bornStreet : Born -> String
bornStreet = street . bornAt

export
setCurrentStreet : String -> Person -> Person
setCurrentStreet street person = { address.street := street } person

export
renameStreets : (String -> String) -> Person -> Person
renameStreets f = { born.bornAt.street $= f, address.street $= f }
