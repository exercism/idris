
def generate_test(case):
    def to_item(data):
        weight = data["weight"]
        value = data["value"]
        return f'item {weight} {value}'

    property = case["property"]
    expected = case["expected"]
    maximumWeight = case["input"]["maximumWeight"]
    items = case["input"]["items"]
    items = str(list(map(to_item, items))).replace("'", "")
    if items == "[]":
        items = "(the (List Item) [])"

    return f'assertEq ({property} {maximumWeight} {items}) {expected}'
