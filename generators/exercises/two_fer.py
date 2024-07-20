
def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    name = case["input"]["name"]
    if name:
        name = f'Just "{name}"'
    else:
        name = "Nothing"

    return f'assertEq ({property} $ {name}) "{expected}"'
