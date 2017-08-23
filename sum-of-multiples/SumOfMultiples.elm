module SumOfMultiples exposing (..)


isFactor : List Int -> Int -> Bool
isFactor factors n =
    List.any (\x -> rem n x == 0) factors


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples factors limit =
    List.sum <| List.filter (isFactor factors) <| List.range 1 (limit - 1)
