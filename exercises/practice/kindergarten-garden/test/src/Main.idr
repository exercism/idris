module Main

import System
import Tester
import Tester.Runner

import KindergartenGarden
import Data.Vect

public export
implementation Eq Plant where
  (==) Grass Grass = True
  (==) Clover Clover = True
  (==) Radishes Radishes = True
  (==) Violets Violets = True
  (==) _ _ = False

public export
implementation Show Plant where
  show Grass = "Grass"
  show Clover = "Clover"
  show Radishes = "Radishes"
  show Violets = "Violets"

tests : List Test
tests =
  [ test "garden with single student"                   (assertEq (plants "RC\nGG" "Alice") $ Just [Radishes, Clover, Grass, Grass])
  , test "different garden with single student"         (assertEq (plants "VC\nRC" "Alice") $ Just [Violets, Clover, Radishes, Clover])
  , test "garden with two students"                     (assertEq (plants "VVCG\nVVRC" "Bob") $ Just [Clover, Grass, Radishes, Clover])
  , test "second student's garden"                      (assertEq (plants "VVCCGG\nVVCCGG" "Bob") $ Just [Clover, Clover, Clover, Clover])
  , test "third student's garden"                       (assertEq (plants "VVCCGG\nVVCCGG" "Charlie") $ Just [Grass, Grass, Grass, Grass])
  , test "for Alice, first student's garden"            (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Alice") $ Just [Violets, Radishes, Violets, Radishes])
  , test "for Bob, second student's garden"             (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Bob") $ Just [Clover, Grass, Clover, Clover])
  , test "for Charlie"                                  (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Charlie") $ Just [Violets, Violets, Clover, Grass])
  , test "for David"                                    (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "David") $ Just [Radishes, Violets, Clover, Radishes])
  , test "for Eve"                                      (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Eve") $ Just [Clover, Grass, Radishes, Grass])
  , test "for Fred"                                     (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Fred") $ Just [Grass, Clover, Violets, Clover])
  , test "for Ginny"                                    (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ginny") $ Just [Clover, Grass, Grass, Clover])
  , test "for Harriet"                                  (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Harriet") $ Just [Violets, Radishes, Radishes, Violets])
  , test "for Ileana"                                   (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ileana") $ Just [Grass, Clover, Violets, Clover])
  , test "for Joseph"                                   (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Joseph") $ Just [Violets, Clover, Violets, Grass])
  , test "for Kincaid, second to last student's garden" (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Kincaid") $ Just [Grass, Clover, Clover, Grass])
  , test "for Larry, last student's garden"             (assertEq (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Larry") $ Just [Grass, Violets, Clover, Violets])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
