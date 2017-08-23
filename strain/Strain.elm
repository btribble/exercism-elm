module Strain exposing (..)

import List exposing (foldr)


keep : (a -> Bool) -> List a -> List a
keep callback lst =
    let
        conditionalCons front back =
            if callback front then
                front :: back
            else
                back
    in
        foldr conditionalCons [] lst


discard callback lst =
    let
        conditionalCons front back =
            if callback front then
                back
            else
                front :: back
    in
        foldr conditionalCons [] lst
