def generate_test(case):
    expected = case["expected"]
    if case["property"] == "total":
        return f"assertEq totalGrains {expected}"

    square = case["input"]["square"]
    if square < 0:
        square = f"$ {square}"
    if isinstance(expected, dict):
        expected = "Nothing"
    else:
        expected = f"Just {expected}"
    return f"assertEq (grains {square}) $ {expected}"
