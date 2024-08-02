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
create : Direction -> Integer -> Integer -> Robot
create direction x y = ?create_rhs

public export
move : Robot -> List Instruction -> Robot
move robot instructions = ?move_rhs
