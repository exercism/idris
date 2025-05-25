HEADER = """
public export
implementation Eq Category where
  (==) Perfect Perfect = True
  (==) Abundant Abundant = True
  (==) Deficient Deficient = True
  (==) _ _ = False

public export
implementation Show Category where
  show Perfect = "Perfect"
  show Abundant = "Abundant"
  show Deficient = "Deficient"
"""


def header():
    return HEADER


def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if isinstance(expected, dict):
        expected = "Nothing"
    else:
        expected = f"Just {expected.title()}"
    number = case["input"]["number"]
    if number < 0:
        number = f"$ {number}"

    return f"assertEq ({property} {number}) $ {expected}"
