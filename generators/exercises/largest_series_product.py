HEADER = """
export
implementation Eq Error where
  (==) StringContainsNonDigit StringContainsNonDigit = True
  (==) SpanExceedsStringLength SpanExceedsStringLength = True
  (==) _ _ = False

export
implementation Show Error where
  show StringContainsNonDigit = "StringContainsNonDigit"
  show SpanExceedsStringLength = "SpanExceedsStringLength"
"""


def header():
    return HEADER


def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if isinstance(expected, dict):
        expected = expected["error"]
        if expected == "digits input must only contain digits":
            expected = "Left StringContainsNonDigit"
        elif expected == "span must not exceed string length":
            expected = "Left SpanExceedsStringLength"
        else:
            raise Exception(f"Unexpected error {expected}")
    else:
        expected = f"Right {expected}"

    digits = case["input"]["digits"]
    span = case["input"]["span"]

    return f'assertEq ({property} "{digits}" {span}) $ {expected}'
