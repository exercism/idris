module Main

import System
import Tester
import Tester.Runner

import ZebraPuzzle

public export
implementation Eq Nationality where
  (==) Englishman Englishman = True
  (==) Japanese Japanese = True
  (==) Norwegian Norwegian = True
  (==) Spaniard Spaniard = True
  (==) Ukrainian Ukrainian = True
  (==) _ _ = False

public export
implementation Show Nationality where
  show Englishman = "Englishman"
  show Japanese = "Japanese"
  show Norwegian = "Norwegian"
  show Spaniard = "Spaniard"
  show Ukrainian = "Ukrainian"

tests : List Test
tests =
  [ test "resident who drinks water" (assertEq solution.drinksWater Norwegian)
  , test "resident who owns zebra"   (assertEq solution.ownsZebra Japanese)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
