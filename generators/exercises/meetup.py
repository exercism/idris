MONTHS = [
    None,
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
]


def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    year = case["input"]["year"]
    month = MONTHS[case["input"]["month"]]
    week = case["input"]["week"].title()
    dayofweek = case["input"]["dayofweek"]

    return f'assertEq ({property} {year} {month} {week} {dayofweek}) "{expected}"'
