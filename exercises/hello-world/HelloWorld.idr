module HelloWorld

greet : Maybe String -> String
greet subject = "Hello, " ++ fromMaybe "World!" subject