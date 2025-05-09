module Main

import System
import Tester
import Tester.Runner

import LensPerson
import Data.String

jane = (MkPerson "Jane Joanna Doe" (MkBorn (MkAddress "Longway" 1024 "Springfield" "United States") "1984-04-12") (MkAddress "Shortlane" 2 "Fallmeadow" "Canada"))

tests : List Test
tests =
  [ test "bornStreet should be Longway"                  (assertEq ((bornStreet . born) jane) "Longway")
  , test "current street should be set to Middleroad"    (assertEq ((street . address . setCurrentStreet "Middleroad") jane) "Middleroad")
  , test "birth street should be renamed to LONGWAY"     (assertEq ((street . bornAt . born . renameStreets toUpper) jane) "LONGWAY")
  , test "current street should be renamed to SHORTLANE" (assertEq ((street . address . renameStreets toUpper) jane) "SHORTLANE")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
