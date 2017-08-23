module Triangle exposing (..)
import Set

{-
# Triangle

Determine if a triangle is equilateral, isosceles, or scalene.

An _equilateral_ triangle has all three sides the same length.<br/>
An _isosceles_ triangle has at least two sides the same length. (It is sometimes
specified as having exactly two sides the same length, but for the purposes of
this exercise we'll say at least two.)<br/>
A _scalene_ triangle has all sides of different lengths.

## Note

For a shape to be a triangle at all, all sides have to be of length > 0, and
the sum of the lengths of any two sides must be greater than or equal to the
length of the third side. See [Triangle Inequality](https://en.wikipedia.org/wiki/Triangle_inequality).

Err "Invalid lengths"
Err "Violates inequality"

-}

type Triangle =
  Equilateral
  | Isosceles
  | Scalene

triangleKind: Float -> Float -> Float -> Result String Triangle
triangleKind a b c =
    let sides =
      a :: b :: c :: []

    in
      hasValidLengths sides |> Result.andThen hasEquality |> Result.andThen isTriangleOfType

hasValidLengths: List Float -> Result String (List Float)
hasValidLengths sides =
  case (List.filter (\x -> x <= 0) sides) of
      [] ->
        Ok (List.sort sides)

      err ->
        Err "Invalid lengths"

hasEquality: List Float -> Result String (List Float)
hasEquality sides =
    case sides of
        [ a, b, c ] ->
            if a + b > c then
              Ok sides
            else
              Err "Violates inequality"
        _ ->
          Err "Violates inequlity"

isTriangleOfType: List Float -> Result String Triangle
isTriangleOfType sides =
  case (Set.fromList sides |> Set.size) of
    1 ->
      Ok Equilateral
    2 ->
      Ok Isosceles
    _ ->
      Ok Scalene
