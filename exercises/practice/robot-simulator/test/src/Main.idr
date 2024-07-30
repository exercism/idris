module Main

import System
import Tester
import Tester.Runner

import RobotSimulator
import Data.Vect

public export
implementation Eq Direction where
  (==) North North = True
  (==) East East = True
  (==) South South = True
  (==) West West = True
  (==) _ _ = False

public export
implementation Show Direction where
  show North = "North"
  show East = "East"
  show South = "South"
  show West = "West"

public export
implementation Eq Robot where
  (==) (MkRobot d1 c1) (MkRobot d2 c2) = (d1 == d2) && (c1 == c2)

public export
implementation Show Robot where
  show (MkRobot direction coordinates) = "MkRobot " ++ (show direction) ++ " " ++ (show coordinates)

tests : List Test
tests =
  [ test "at origin facing north"            (assertEq (create North 0 0) (MkRobot North [0, 0]))
  , test "at negative position facing south" (assertEq (create South (-1) (-1)) (MkRobot South [-1, -1]))
  , test "changes north to east"             (assertEq (move (MkRobot North [0, 0]) [R]) (MkRobot East [0, 0]))
  , test "changes east to south"             (assertEq (move (MkRobot East [0, 0]) [R]) (MkRobot South [0, 0]))
  , test "changes south to west"             (assertEq (move (MkRobot South [0, 0]) [R]) (MkRobot West [0, 0]))
  , test "changes west to north"             (assertEq (move (MkRobot West [0, 0]) [R]) (MkRobot North [0, 0]))
  , test "changes north to west"             (assertEq (move (MkRobot North [0, 0]) [L]) (MkRobot West [0, 0]))
  , test "changes west to south"             (assertEq (move (MkRobot West [0, 0]) [L]) (MkRobot South [0, 0]))
  , test "changes south to east"             (assertEq (move (MkRobot South [0, 0]) [L]) (MkRobot East [0, 0]))
  , test "changes east to north"             (assertEq (move (MkRobot East [0, 0]) [L]) (MkRobot North [0, 0]))
  , test "facing north increments Y"         (assertEq (move (MkRobot North [0, 0]) [A]) (MkRobot North [0, 1]))
  , test "facing south decrements Y"         (assertEq (move (MkRobot South [0, 0]) [A]) (MkRobot South [0, -1]))
  , test "facing east increments X"          (assertEq (move (MkRobot East [0, 0]) [A]) (MkRobot East [1, 0]))
  , test "facing west decrements X"          (assertEq (move (MkRobot West [0, 0]) [A]) (MkRobot West [-1, 0]))
  , test "moving east and north from README" (assertEq (move (MkRobot North [7, 3]) [R, A, A, L, A, L]) (MkRobot West [9, 4]))
  , test "moving west and north"             (assertEq (move (MkRobot North [0, 0]) [L, A, A, A, R, A, L, A]) (MkRobot West [-4, 1]))
  , test "moving west and south"             (assertEq (move (MkRobot East [2, -7]) [R, R, A, A, A, A, A, L, A]) (MkRobot South [-3, -8]))
  , test "moving east and north"             (assertEq (move (MkRobot South [8, 4]) [L, A, A, A, R, R, R, A, L, L, L, L]) (MkRobot North [11, 5]))
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
