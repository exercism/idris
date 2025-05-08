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
bornStreet born = ?bornStreet_rhs

export
setCurrentStreet : String -> Person -> Person
setCurrentStreet street person = ?setCurrentStreet_rhs

export
renameStreets : (String -> String) -> Person -> Person
renameStreets f person = ?renameStreets_rhs
