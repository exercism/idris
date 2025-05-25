def generate_test(case):
    def to_tree(data):
        if data is None:
            return "Hollow"
        if isinstance(data, list):
            return "Branch " + str(list(map(to_tree, data))).replace("'", "")
        if data < 0:
            data = f"({data})"
        return f"Leaf {data}"

    property = case["property"]
    expected = case["expected"]
    if expected == []:
        expected = "(the (List Int) [])"
    tree = to_tree(case["input"]["array"])
    return f"assertEq ({property} $ {tree}) {expected}"
