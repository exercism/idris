
HEADER = """import Data.Vect

public export
implementation Eq Direction where
  (==) North North = True
  (==) East East = True
  (==) South South = True
  (==) West West = True
  (==) _ _ = False

public export
implementation Show Direction where
  show North = "North"
  show East = "East"
  show South = "South"
  show West = "West"

public export
implementation Eq Robot where
  (==) (MkRobot d1 c1) (MkRobot d2 c2) = (d1 == d2) && (c1 == c2)

public export
implementation Show Robot where
  show (MkRobot direction coordinates) = "MkRobot " ++ (show direction) ++ " " ++ (show coordinates)
"""

def header():
    return HEADER

def generate_test(case):
    def to_robot(data):
      x = data["position"]["x"]
      y = data["position"]["y"]
      direction = data["direction"].title()
      return f'(MkRobot {direction} [{x}, {y}])'

    property = case["property"]
    expected = to_robot(case["expected"])
    robot = to_robot(case["input"])
    instructions = case["input"]["instructions"]
    instructions = str(list(instructions)).replace("'", "")
    return f'assertEq ({property} {robot} {instructions}) {expected}'
