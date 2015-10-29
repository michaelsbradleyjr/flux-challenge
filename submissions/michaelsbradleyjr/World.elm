module World (init, Model, template) where

import Html exposing (..)
import Html.Attributes exposing (..)


-- MAIN
--
-- main = template init


-- MODEL

type alias Model = String

init : Model
init = "..."


-- TEMPLATE

template : Model -> Html
template model = h1
                 [ class "css-planet-monitor" ]
                 [ text ("Obi-Wan currently on " ++ model) ]
