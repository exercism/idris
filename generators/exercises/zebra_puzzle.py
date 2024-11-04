
HEADER = """
public export
implementation Eq Nationality where
  (==) Englishman Englishman = True
  (==) Japanese Japanese = True
  (==) Norwegian Norwegian = True
  (==) Spaniard Spaniard = True
  (==) Ukrainian Ukrainian = True
  (==) _ _ = False

public export
implementation Show Nationality where
  show Englishman = "Englishman"
  show Japanese = "Japanese"
  show Norwegian = "Norwegian"
  show Spaniard = "Spaniard"
  show Ukrainian = "Ukrainian"
"""

def header():
    return HEADER

def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    return f'assertEq solution.{property} {expected}'
