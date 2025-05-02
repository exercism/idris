
def header():
    return "import Data.Fin\n"

def generate_test(case):
    # "total" is taken: https://docs.idris-lang.org/en/latest/reference/syntax-guide.html#totality
    property = "price"

    expected = case["expected"]
    basket = case["input"]["basket"]
    if basket == []:
        basket = "(the (List (Fin 6)) [])"

    return f'assertEq ({property} {basket}) $ {expected}'
