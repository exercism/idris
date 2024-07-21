
def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    word = case["input"]["word"]
    return f'assertEq ({property} "{word}") {expected}'
