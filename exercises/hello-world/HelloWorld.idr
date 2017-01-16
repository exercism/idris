module HelloWorld

export
greet : Maybe String -> String
greet subject = "Hello, " ++ fromMaybe "World" subject ++ "!"
