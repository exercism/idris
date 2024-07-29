module RobotSimulator

import Data.Vect

public export
data Direction = North | East | South | West

public export
data Instruction = R | L | A

public export
record Robot where
  constructor MkRobot
  direction : Direction
  coordinates : Vect 2 Integer

public export
move : Robot -> List Instruction -> Robot
move robot [] = robot
move (MkRobot direction coordinates) (R :: remaining) = move (MkRobot (right direction) coordinates) remaining
  where right : Direction -> Direction
        right North = East
        right East = South
        right South = West
        right West = North
move (MkRobot direction coordinates) (L :: remaining) = move (MkRobot (left direction) coordinates) remaining
  where left : Direction -> Direction
        left North = West
        left East = North
        left South = East
        left West = South
move (MkRobot direction coordinates) (A :: remaining) = move (MkRobot direction (advance direction coordinates)) remaining
  where advance : Direction -> Vect 2 Integer -> Vect 2 Integer
        advance North [x, y] = [x, y + 1]
        advance East [x, y] = [x + 1, y]
        advance South [x, y] = [x, y - 1]
        advance West [x, y] = [x - 1, y]
