module ScrabbleScore exposing (..)

import LetterPoints exposing (letterDict)
import Dict exposing (get)


scoreWord word =
    let
        letterPoints =
            word
                |> String.toUpper
                |> String.split ""
                |> getLetterScores

        getLetterScores lst =
            List.map (\x -> Maybe.withDefault 0 (Dict.get x letterDict)) lst
    in
        List.sum letterPoints
