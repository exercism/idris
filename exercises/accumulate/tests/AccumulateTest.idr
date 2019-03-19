import Specdris.Spec

import Accumulate

main : IO ()
main = spec $ do
  it "empty list does nothing"        $ accumulate (\x => x)         []        === the (List Int) []
  it "identity function does nothing" $ accumulate (\x => x)         [1, 2, 3] === [1, 2, 3]
  it "square function squares input"  $ accumulate (\x => x * x)     [1, 2, 3] === [1, 4, 9]
  it "cube function cubes input"      $ accumulate (\x => x * x * x) [1, 2, 3] === [1, 8, 27]
  it "increment function increments"  $ accumulate (\x => x + 1)     [1, 2, 3] === [2, 3, 4]
  it "decrement function decrements"  $ accumulate (\x => x - 1)     [1, 2, 3] === [0, 1, 2]
