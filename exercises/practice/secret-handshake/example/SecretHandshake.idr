module SecretHandshake

public export
data Action = Wink | DoubleBlink | CloseYourEyes | Jump

export
commands : Int -> List Action
commands number = loop commandList [] number
  where commandList = [Wink, DoubleBlink, CloseYourEyes, Jump]
        loop : List Action -> List Action -> Int -> List Action
        loop [] suffix n = if n == 0 then reverse suffix
                           else suffix
        loop (x :: xs) suffix n = if mod n 2 == 1 then loop xs (x :: suffix) (div n 2)
                                  else loop xs suffix (div n 2)
