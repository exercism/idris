import Specdris.Spec

import HelloWorld

main : IO ()
main = spec $ do
  it "Say Hi!" $ hello === "Hello, World!"
