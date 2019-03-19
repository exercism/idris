import Specdris.Spec

import Data.Vect

import RnaTranscription

main : IO ()
main = spec $ do
  it "RNA complement of cytosine is guanine" $ toRna [C] === [G]
  it "RNA complement of guanine is cytosine" $ toRna [G] === [C]
  it "RNA complement of thymine is adenine"  $ toRna [T] === [A]
  it "RNA complement of adenine is uracil"   $ toRna [A] === [U]
