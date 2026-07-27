module Main

import System
import Tester
import Tester.Runner

import Acronym

tests : List Test
tests =
  [ test "basic"                          (assertEq (abbreviate "Portable Network Graphics") "PNG")
  , test "lowercase words"                (assertEq (abbreviate "Ruby on Rails") "ROR")
  , test "punctuation"                    (assertEq (abbreviate "First In, First Out") "FIFO")
  , test "all caps word"                  (assertEq (abbreviate "GNU Image Manipulation Program") "GIMP")
  , test "punctuation without whitespace" (assertEq (abbreviate "Complementary metal-oxide semiconductor") "CMOS")
  , test "very long abbreviation"         (assertEq (abbreviate "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me") "ROTFLSHTMDCOALM")
  , test "consecutive delimiters"         (assertEq (abbreviate "Something - I made up from thin air") "SIMUFTA")
  , test "apostrophes"                    (assertEq (abbreviate "Halley's Comet") "HC")
  , test "underscore emphasis"            (assertEq (abbreviate "The Road _Not_ Taken") "TRNT")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
