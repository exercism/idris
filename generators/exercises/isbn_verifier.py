def generate_test(case):
    property = "isValid"
    isbn = case["input"]["isbn"]
    expected = case["expected"]
    if expected:
        prefix = "assert $      "
    else:
        prefix = "assert $ not $"

    return f'{prefix} {property} "{isbn}"'
