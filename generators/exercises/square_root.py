def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    radicand = case["input"]["radicand"]
    return f"assertEq ({property} {radicand}) {expected}"
