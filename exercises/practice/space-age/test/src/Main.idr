module Main

import System
import Tester
import Tester.Runner

import SpaceAge

assertApprox : Double -> Double -> TestFunc ()
assertApprox actual = assertEq $ (floor (actual * 100.0 + 0.5)) / 100.0

tests : List Test
tests =
  [ test "age on Earth"   (assertApprox (age Earth 1000000000) 31.69)
  , test "age on Mercury" (assertApprox (age Mercury 2134835688) 280.88)
  , test "age on Venus"   (assertApprox (age Venus 189839836) 9.78)
  , test "age on Mars"    (assertApprox (age Mars 2129871239) 35.88)
  , test "age on Jupiter" (assertApprox (age Jupiter 901876382) 2.41)
  , test "age on Saturn"  (assertApprox (age Saturn 2000000000) 2.15)
  , test "age on Uranus"  (assertApprox (age Uranus 1210123456) 0.46)
  , test "age on Neptune" (assertApprox (age Neptune 1821023456) 0.35)
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
