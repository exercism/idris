def generate_test(case):
    property = "isLeap"
    expected = case["expected"]
    year = case["input"]["year"]
    if expected:
        prefix = "assert $      "
    else:
        prefix = "assert $ not $"

    return f"{prefix} {property} {year}"
