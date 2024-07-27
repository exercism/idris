module Main

import System
import Tester
import Tester.Runner

import SecretHandshake

public export
implementation Eq Action where
  (==) Wink Wink = True
  (==) DoubleBlink DoubleBlink = True
  (==) CloseYourEyes CloseYourEyes = True
  (==) Jump Jump = True
  (==) _ _ = False

public export
implementation Show Action where
  show Wink = "Wink"
  show DoubleBlink = "DoubleBlink"
  show CloseYourEyes = "CloseYourEyes"
  show Jump = "Jump"

tests : List Test
tests =
  [ test "wink for 1"                                  (assertEq (commands 1) [Wink])
  , test "double blink for 10"                         (assertEq (commands 2) [DoubleBlink])
  , test "close your eyes for 100"                     (assertEq (commands 4) [CloseYourEyes])
  , test "jump for 1000"                               (assertEq (commands 8) [Jump])
  , test "combine two actions"                         (assertEq (commands 3) [Wink, DoubleBlink])
  , test "reverse two actions"                         (assertEq (commands 19) [DoubleBlink, Wink])
  , test "reversing one action gives the same action"  (assertEq (commands 24) [Jump])
  , test "reversing no actions still gives no actions" (assertEq (commands 16) [])
  , test "all possible actions"                        (assertEq (commands 15) [Wink, DoubleBlink, CloseYourEyes, Jump])
  , test "reverse all possible actions"                (assertEq (commands 31) [Jump, CloseYourEyes, DoubleBlink, Wink])
  , test "do nothing for zero"                         (assertEq (commands 0) [])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
