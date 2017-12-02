module Test.Isogram

import Isogram

%access export

assertEq : Eq a => (given : a) -> (expected : a) -> IO ()
assertEq g e = putStrLn $ if g == e
                             then "Test Passed"
                             else "Test Failed"

testEmptyString : IO ()
testEmptyString = assertEq True $ isogram ""

testIsogramWithOnlyLowerCaseCharacters : IO ()
testIsogramWithOnlyLowerCaseCharacters = assertEq True $ isogram "isogram"

testWordWithOneDuplicatedCharacter : IO ()
testWordWithOneDuplicatedCharacter = assertEq False $ isogram "eleven"

testLongestReportedEnglishIsogram : IO ()
testLongestReportedEnglishIsogram = assertEq True $ isogram "subdermatoglyphic"

testWordWithDuplicatedCharacterInMixedCase : IO ()
testWordWithDuplicatedCharacterInMixedCase = assertEq False $ isogram "Alphabet"

testHypotheticalIsogramicWordWithHyphen : IO ()
testHypotheticalIsogramicWordWithHyphen = assertEq True $ isogram "thumbscrew-japingly"

testIsogramWithDuplicatedHyphen : IO ()
testIsogramWithDuplicatedHyphen = assertEq True $ isogram "six-year-old"

testMadeupNameThatIsAnIsogram : IO ()
testMadeupNameThatIsAnIsogram = assertEq True $ isogram "Emily Jung Schwartzkopf"

testDuplicatedCharacterInTheMiddle : IO ()
testDuplicatedCharacterInTheMiddle = assertEq False $ isogram "accentor"

runTests : IO ()
runTests = do
    testEmptyString
    testIsogramWithOnlyLowerCaseCharacters
    testWordWithOneDuplicatedCharacter
    testLongestReportedEnglishIsogram
    testWordWithDuplicatedCharacterInMixedCase
    testHypotheticalIsogramicWordWithHyphen
    testIsogramWithDuplicatedHyphen
    testMadeupNameThatIsAnIsogram
    testDuplicatedCharacterInTheMiddle
