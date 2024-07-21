
def generate_test(case):
    def parenthesize_if_negative(number):
        if number < 0:
            return f'({number})'
        else:
            return f'{number}'

    property = case["property"]
    expected = case["expected"]
    x = parenthesize_if_negative(case["input"]["x"])
    y = parenthesize_if_negative(case["input"]["y"])
    return f'assertEq ({property} {x} {y}) {expected}'
