module Pangram exposing (..)

import Char exposing (fromCode)
import String exposing (toLower, fromChar)
import List exposing (all, range)

-- These are the ascii keycodes for a - z lowercase http://help.adobe.com/en_US/AS2LCR/Flash_10.0/help.html?content=00000520.html
asciiKeyCodes: List Int
asciiKeyCodes =
  range 97 122

isPangram: String -> Bool
isPangram sentence =
  let
    lowerSentence =
      toLower sentence
  in
    -- has codes is being used with partial application here, the code is supplied via the all function and the list asciiKeyCodes
    all (hasCodes lowerSentence) asciiKeyCodes

hasCodes: String -> Char.KeyCode -> Bool
hasCodes sentence code =
    let
      letter =
        code
          |> fromCode
          |> fromChar

    in
      String.contains letter sentence
