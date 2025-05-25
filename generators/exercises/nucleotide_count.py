HEADER = """
export
implementation Eq DNA where
  (==) (MkDNA a1 c1 g1 t1) (MkDNA a2 c2 g2 t2) = (a1 == a2) && (c1 == c2) && (g1 == g2) && (t1 == t2)

export
implementation Show DNA where
  show (MkDNA a c g t) = "(MkDNA " ++ (show a) ++ " " ++ (show c) ++ " " ++ (show g) ++ " " ++ (show t) ++ ")"
"""


def header():
    return HEADER


def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if "error" in expected.keys():
        expected = "Nothing"
    else:
        adenine = expected["A"]
        cytosine = expected["C"]
        guanine = expected["G"]
        thymine = expected["T"]
        expected = f"Just $ MkDNA {adenine} {cytosine} {guanine} {thymine}"

    strand = case["input"]["strand"]
    return f'assertEq ({property} "{strand}") $ {expected}'
