
JANE = {
    "name": "Jane Joanna Doe",
    "born": {
        "bornAt": {
            "street": "Longway",
            "houseNumber": 1024,
            "place": "Springfield",
            "country": "United States"
        },
        "bornOn": "1984-04-12"
    },
    "address": {
        "street": "Shortlane",
        "houseNumber": 2,
        "place": "Fallmeadow",
        "country": "Canada"
    }
}

EXTRA_CASES = [
    {
        "description": "bornStreet should be Longway",
        "property": "bornStreet . born",
        "input": {
            "person": "jane"
        },
        "expected": "Longway"
    },
    {
        "description": "current street should be set to Middleroad",
        "property": "street . address . setCurrentStreet",
        "input": {
            "street": "Middleroad",
            "person": "jane"
        },
        "expected": "Middleroad"
    },
    {
        "description": "birth street should be renamed to LONGWAY",
        "property": "street . bornAt . born . renameStreets toUpper",
        "input": {
            "person": "jane"
        },
        "expected": "LONGWAY"
    },
    {
        "description": "current street should be renamed to SHORTLANE",
        "property": "street . address . renameStreets toUpper",
        "input": {
            "person": "jane"
        },
        "expected": "SHORTLANE"
    }
]

def header():
    jane = serialize_person(JANE)
    return f"import Data.String\n\njane = {jane}\n"

def extra_cases():
    return EXTRA_CASES

def serialize_address(address):
    street = address["street"]
    houseNumber = address["houseNumber"]
    place = address["place"]
    country = address["country"]
    return f'(MkAddress "{street}" {houseNumber} "{place}" "{country}")'

def serialize_born(born):
    bornAt = serialize_address(born["bornAt"])
    bornOn = born["bornOn"]
    return f'(MkBorn {bornAt} "{bornOn}")'

def serialize_person(person):
    name = person["name"]
    born = serialize_born(person["born"])
    address = serialize_address(person["address"])
    return f'(MkPerson "{name}" {born} {address})'

def generate_test(case):
    property = case["property"]
    if "street" in case["input"].keys():
        street = case["input"]["street"]
        property = f'{property} "{street}"'
    expected = case["expected"]
    person = case["input"]["person"]
    return f'assertEq (({property}) {person}) "{expected}"'
