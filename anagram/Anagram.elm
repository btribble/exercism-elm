module Anagram exposing (..)


normalize : String -> List Char
normalize =
    List.sort << String.toList << String.toLower


isAnagram : String -> String -> Bool
isAnagram word other =
    String.toLower word
        /= String.toLower other
        && normalize word
        == normalize other


detect : String -> List String -> List String
detect word list =
    List.filter (isAnagram word) list
