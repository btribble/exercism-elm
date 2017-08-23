module WordCount exposing (..)

import Dict exposing (Dict, update)
import Regex exposing (regex, replace)


inc =
    Maybe.withDefault 0 >> (+) 1 >> Just


punctuation =
    regex "[!@#$%^&*():;\"',.]+"


wordCount : String -> Dict String Int
wordCount subject =
    String.toLower subject
        |> replace Regex.All punctuation (\_ -> "")
        |> String.words
        |> List.foldr (\word acc -> update word inc acc) Dict.empty
