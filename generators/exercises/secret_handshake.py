
HEADER = """
public export
implementation Eq Action where
  (==) Wink Wink = True
  (==) DoubleBlink DoubleBlink = True
  (==) CloseYourEyes CloseYourEyes = True
  (==) Jump Jump = True
  (==) _ _ = False

public export
implementation Show Action where
  show Wink = "Wink"
  show DoubleBlink = "DoubleBlink"
  show CloseYourEyes = "CloseYourEyes"
  show Jump = "Jump"
"""

def header():
    return HEADER

def generate_test(case):
    def toActionList(strings):
        return str(list(map(lambda str: str.title().replace(" ", ""), strings))).replace("'", "")

    property = case["property"]
    number = case["input"]["number"]
    expected = toActionList(case["expected"])

    return f'assertEq ({property} {number}) {expected}'
