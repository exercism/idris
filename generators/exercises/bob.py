from json import dumps

def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    hey_bob = dumps(case["input"]["heyBob"])
    return f'assertEq ({property} {hey_bob}) "{expected}"'
