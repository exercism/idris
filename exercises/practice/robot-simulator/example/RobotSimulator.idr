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
move = foldl movement
  where movement : Robot -> Instruction -> Robot
        movement (MkRobot direction coordinates) R = MkRobot (right direction) coordinates
          where right : Direction -> Direction
                right North = East
                right East = South
                right South = West
                right West = North
        movement (MkRobot direction coordinates) L = MkRobot (left direction) coordinates
          where left : Direction -> Direction
                left North = West
                left East = North
                left South = East
                left West = South
        movement (MkRobot direction coordinates) A = MkRobot direction (advance direction coordinates)
          where advance : Direction -> Vect 2 Integer -> Vect 2 Integer
                advance North [x, y] = [x, y + 1]
                advance East [x, y] = [x + 1, y]
                advance South [x, y] = [x, y - 1]
                advance West [x, y] = [x - 1, y]
