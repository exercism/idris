
HEADER = """
assertApprox : Double -> Double -> TestFunc ()
assertApprox actual = assertEq $ (floor (actual * 100.0 + 0.5)) / 100.0
"""

def header():
    return HEADER

def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    planet = case["input"]["planet"]
    seconds = case["input"]["seconds"]
    return f'assertApprox ({property} {planet} {seconds}) {expected}'
