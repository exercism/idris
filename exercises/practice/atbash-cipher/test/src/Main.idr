module Main

import System
import Tester
import Tester.Runner

import AtbashCipher

tests : List Test
tests =
  [ test "encode yes"                  (assertEq (encode "yes") "bvh")
  , test "encode no"                   (assertEq (encode "no") "ml")
  , test "encode OMG"                  (assertEq (encode "OMG") "lnt")
  , test "encode spaces"               (assertEq (encode "O M G") "lnt")
  , test "encode mindblowingly"        (assertEq (encode "mindblowingly") "nrmwy oldrm tob")
  , test "encode numbers"              (assertEq (encode "Testing,1 2 3, testing.") "gvhgr mt123 gvhgr mt")
  , test "encode deep thought"         (assertEq (encode "Truth is fiction.") "gifgs rhurx grlm")
  , test "encode all the letters"      (assertEq (encode "The quick brown fox jumps over the lazy dog.") "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
  , test "decode exercism"             (assertEq (decode "vcvix rhn") "exercism")
  , test "decode a sentence"           (assertEq (decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v") "anobstacleisoftenasteppingstone")
  , test "decode numbers"              (assertEq (decode "gvhgr mt123 gvhgr mt") "testing123testing")
  , test "decode all the letters"      (assertEq (decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt") "thequickbrownfoxjumpsoverthelazydog")
  , test "decode with too many spaces" (assertEq (decode "vc vix    r hn") "exercism")
  , test "decode with no spaces"       (assertEq (decode "zmlyhgzxovrhlugvmzhgvkkrmthglmv") "anobstacleisoftenasteppingstone")
  ]

export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
