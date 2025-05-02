
HEADER = """import Data.Vect

public export
implementation Eq Plant where
  (==) Grass Grass = True
  (==) Clover Clover = True
  (==) Radishes Radishes = True
  (==) Violets Violets = True
  (==) _ _ = False

public export
implementation Show Plant where
  show Grass = "Grass"
  show Clover = "Clover"
  show Radishes = "Radishes"
  show Violets = "Violets"
"""

def header():
    return HEADER

def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if expected.__class__ == dict:
        expected = "Nothing"
    else:
        expected = str(list(map(lambda plant : plant.title(), expected))).replace("'", "")
        expected = f"Just {expected}"

    diagram = case["input"]["diagram"].replace("\n", "\\n")
    student = case["input"]["student"]
    return f'assertEq ({property} "{diagram}" "{student}") $ {expected}'
