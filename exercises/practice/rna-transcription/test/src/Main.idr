module Main

import System
import Tester
import Tester.Runner

import RnaTranscription
import Data.Vect

tests : List Test
tests =
  [ test "Empty RNA sequence"                    (assertEq (toRna []) (the (Vect 0 RnaStrand) []))
  , test "RNA complement of cytosine is guanine" (assertEq (toRna [C]) [G])
  , test "RNA complement of guanine is cytosine" (assertEq (toRna [G]) [C])
  , test "RNA complement of thymine is adenine"  (assertEq (toRna [T]) [A])
  , test "RNA complement of adenine is uracil"   (assertEq (toRna [A]) [U])
  , test "RNA complement"                        (assertEq (toRna [A, C, G, T, G, G, T, C, T, T, A, A]) [U, G, C, A, C, C, A, G, A, A, U, U])
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
