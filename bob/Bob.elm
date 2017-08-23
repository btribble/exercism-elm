module Bob exposing (..)

import Regex exposing (..)


type Comment
    = Silence
    | Shouting
    | Question
    | Other


hey : String -> String
hey comment =
    case parseComment comment of
        Silence ->
            "Fine. Be that way!"

        Shouting ->
            "Whoa, chill out!"

        Question ->
            "Sure."

        Other ->
            "Whatever."


parseComment : String -> Comment
parseComment comment =
    if isSilence comment then
        Silence
    else if isShouting comment then
        Shouting
    else if isQuestion comment then
        Question
    else
        Other


isSilence : String -> Bool
isSilence =
    contains (regex "^\\s*$")


isShouting : String -> Bool
isShouting comment =
    contains (regex "[A-Z]") comment
        && not (contains (regex "[a-z]") comment)


isQuestion : String -> Bool
isQuestion =
    contains (regex "\\?$")
