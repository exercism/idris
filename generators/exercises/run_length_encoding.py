
def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    string = case["input"]["string"]
    if property == "consistency":
        property = "decode $ encode"
    return f'assertEq ({property} "{string}") "{expected}"'
