
def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if expected.__class__ == dict:
        expected = "Nothing"
    else:
        expected = f"Just {expected}"
    number = case["input"]["number"]
    if number < 0:
        number = f"$ {number}"

    return f'assertEq ({property} {number}) $ {expected}'
