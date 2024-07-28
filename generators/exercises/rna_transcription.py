
def header():
    return "import Data.Vect\n"

def generate_test(case):
    def to_vect(proteins):
        return str(list(proteins)).replace("'", "")

    property = case["property"]
    expected = to_vect(case["expected"])
    if expected == "[]":
         expected = "(the (Vect 0 RnaNucleotide) [])"
    dna = to_vect(case["input"]["dna"])

    return f'assertEq ({property} {dna}) {expected}'
