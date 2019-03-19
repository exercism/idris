import Specdris.Spec

import Leap

main : IO ()
main = spec $ do
  it "2015 is not a leap year" $ shouldBeFalse $ isLeap 2015
  it "2016 is a leap year"     $ shouldBeTrue  $ isLeap 2016
  it "2100 is not a leap year" $ shouldBeFalse $ isLeap 2100
  it "2000 is a leap year"     $ shouldBeTrue  $ isLeap 2000
