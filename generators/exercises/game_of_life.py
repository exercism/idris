
def header():
    return "import Data.Vect\n"

def columns(matrix):
    if matrix == []:
        return 0
    return len(matrix[0])

def serialize(matrix):
    return '[\n    ' + (',\n    ').join(map(str, matrix)) + ']'

def generate_test(case):
    property = case["property"]
    matrix = case["input"]["matrix"]
    expected = case["expected"]
    return f'assertEq ({property} {len(matrix)} {columns(matrix)} {serialize(matrix)}\n  ) {serialize(expected)}\n  '
