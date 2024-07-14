module Main

import Data.Vect
import RnaTranscription 
import System

assertCase : Eq b => (a -> b) -> (String, a, b) -> IO ()
assertCase fn (desc,given,expected) = do
  putStrLn desc
  if fn given == expected 
     then putStrLn "  Test Passed"
     else do
       putStrLn "  Test Failed"
       exitFailure


testCases : List (n : Nat ** (String, Vect n DnaStrand, Vect n RnaStrand))
testCases = [(_ ** ("Empty RNA sequence",                    [],                        [])),
             (_ ** ("RNA complement of cytosine is guanine", [C],                       [G])),
             (_ ** ("RNA complement of guanine is cytosine", [G],                       [C])),
             (_ ** ("RNA complement of thymine is adenine",  [T],                       [A])),
             (_ ** ("RNA complement of adenine is uracil",   [A],                       [U])),
             (_ ** ("RNA complement",                        [A,C,G,T,G,G,T,C,T,T,A,A], [U,G,C,A,C,C,A,G,A,A,U,U]))]

main : IO ()
main = traverse_ testCase' testCases
  where testCase' : (n : Nat ** (String, Vect n DnaStrand, Vect n RnaStrand)) -> IO ()
        testCase' (x ** pf) = assertCase toRna pf

