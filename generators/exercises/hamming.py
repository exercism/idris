
EXTRA_CASES = [
    {
        "description": "short identical strands",
        "input": {
            "strand1": "GGACTGA",
            "strand2": "GGACTGA"
        },
        "expected": 0
    },
    {
        "description": "short different strands",
        "input": {
            "strand1": "ACCAGGG",
            "strand2": "ACTATGG"
        },
        "expected": 2
    }
]

def header():
    return "import Data.Vect\n"

def extra_cases():
    return EXTRA_CASES

def generate_test(case):
    def to_vect(strand):
        if strand == "":
            return "(the (Vect 0 Nucleotide) [])"
        return str(list(strand)).replace("'", "")

    property = "hamming_distance"
    expected = case["expected"]
    strand1 = to_vect(case["input"]["strand1"])
    strand2 = to_vect(case["input"]["strand2"])

    return f'assertEq ({property} {strand1} {strand2}) {expected}'
