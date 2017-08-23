module Accumulate exposing (..)
import List exposing (foldr)

accumulate: (a -> b) -> List a -> List b
accumulate callback list =
    foldr (\listItem acc -> callback listItem :: acc) [] list
