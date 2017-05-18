module Raindrops exposing (..)
import List exposing (foldr)


raindrops : Int -> String
raindrops num =
    let
        factorsFinder =
            \( div, noise ) acc ->
                if num % div == 0 then
                    noise ++ acc
                else
                    acc

        result =
            foldr factorsFinder "" rules
    in
        if result == "" then
            toString num
        else
            result


rules : List ( number, String )
rules =
    [ ( 3, "Pling" )
    , ( 5, "Plang" )
    , ( 7, "Plong" )
    ]
