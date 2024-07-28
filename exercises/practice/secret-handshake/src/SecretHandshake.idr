module SecretHandshake

public export
data Action = Wink | DoubleBlink | CloseYourEyes | Jump

export
commands : Int -> List Action
commands number = ?commands_rhs
