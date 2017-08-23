module Leap exposing (..)

{-
   on every year that is evenly divisible by 4
     except every year that is evenly divisible by 100
       unless the year is also evenly divisible by 400
-}


isLeapYear : Int -> Bool
isLeapYear year =
    case isLeap year of
        True ->
            True

        _ ->
            False



-- most specific case
-- rem year 4 == 0 && rem year 100 == 0 && rem year 400 == 0
-- next specific
-- rem year 4 == 0 && rem year 100 /= 0
-- everything else is not a leap year


isLeap : Int -> Bool
isLeap year =
    if rem year 4 == 0 && rem year 100 == 0 && rem year 400 == 0 then
        True
    else if rem year 4 == 0 && rem year 100 /= 0 then
        True
    else
        False
