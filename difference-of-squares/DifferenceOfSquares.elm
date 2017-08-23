module DifferenceOfSquares exposing (..)


square n =
    n ^ 2


squareOfSum : Int -> Int
squareOfSum limit =
    List.range 1 limit |> List.sum |> square


sumOfSquares : Int -> Int
sumOfSquares limit =
    List.range 1 limit |> List.map square |> List.sum


difference limit =
    (-) (squareOfSum limit) (sumOfSquares limit)
