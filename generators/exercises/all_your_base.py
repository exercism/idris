
HEADER = """
export
implementation Eq Error where
  (==) InvalidBase InvalidBase = True
  (==) InvalidDigit InvalidDigit = True
  (==) _ _ = False

export
implementation Show Error where
  show InvalidBase = "InvalidBase"
  show InvalidDigit = "InvalidDigit"
"""

def header():
    return HEADER

def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if expected.__class__ == dict:
        if "digits" in expected["error"]:
            expected = "Left InvalidDigit"
        else:
            expected = "Left InvalidBase"
    else:
        expected = f"Right {expected}"

    inputBase = case["input"]["inputBase"]
    if inputBase < 0:
        inputBase = f"({inputBase})"
    digits = case["input"]["digits"]
    outputBase = case["input"]["outputBase"]
    if outputBase < 0:
        outputBase = f"({outputBase})"

    return f'assertEq ({property} {inputBase} {digits} {outputBase}) $ {expected}'
