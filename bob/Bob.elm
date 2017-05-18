module Bob exposing (..)
import Regex exposing (..)

type Comment
    = Silence
    | Shouting
    | Question
    | Other

hey: String -> String
hey phrase =
  case parsePhrase phrase of
    Silence  ->
      "Fine. Be that way!"

    Shouting  ->
      "Whoa, chill out!"

    Question  ->
      "Sure."

    _ -> "Whatever."


parsePhrase : String -> Comment
parsePhrase comment =
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
isShouting string =
    contains (regex "[A-Z]") string
        && not (contains (regex "[a-z]") string)


isQuestion : String -> Bool
isQuestion =
    contains (regex "\\?$")
