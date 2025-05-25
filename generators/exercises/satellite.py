HEADER = """
export
implementation Eq Tree where
  (==) Leaf Leaf = True
  (==) (Branch left1 value1 right1) (Branch left2 value2 right2) = (left1 == left2) && (value1 == value2) && (right1 == right2)
  (==) _ _ = False

export
implementation Show Tree where
  show Leaf = "Leaf"
  show (Branch left value right) = "(" ++ (show left) ++ " " ++ (show value) ++ " " ++ (show right) ++ ")"
"""


def header():
    return HEADER


def serialize(tree):
    if tree == {}:
        return "Leaf"
    else:
        left = tree["l"]
        value = tree["v"]
        right = tree["r"]
        return f"(Branch {serialize(left)} '{value}' {serialize(right)})"


def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if "error" in expected.keys():
        expected = "Nothing"
    else:
        expected = f"Just {serialize(expected)}"

    preorder = case["input"]["preorder"]
    inorder = case["input"]["inorder"]

    return f"assertEq ({property} {preorder} {inorder}) $ {expected}"
