module SpaceAge exposing (..)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


earthYear =
    31557600


ageOn : Planet -> Float -> Float
ageOn planet time =
    case planet of
        Earth ->
            time / earthYear

        Mercury ->
            time / (earthYear * 0.2408467)

        Venus ->
            time / (earthYear * 0.61519726)

        Mars ->
            time / (earthYear * 1.8808158)

        Jupiter ->
            time / (earthYear * 11.862615)

        Saturn ->
            time / (earthYear * 29.447498)

        Uranus ->
            time / (earthYear * 84.016846)

        Neptune ->
            time / (earthYear * 164.79132)
