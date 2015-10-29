module Scroll (Action, disableDown, disableUp, enableDown, enableUp, init, Model,
               update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MAIN
--
-- main = view (Signal.mailbox ScrollUp).address init


-- MODEL

type alias Model =
  { scrollableDown : Bool
  , scrollableUp : Bool }

init : Model
init = { scrollableDown = False, scrollableUp = False }


-- UPDATE

type Action
  = DisableDown
  | DisableUp
  | EnableDown
  | EnableUp
  | ScrollDown
  | ScrollUp

update : Action -> Model -> Model
update action model =
  case action of
    DisableDown -> { model | scrollableDown <- False }
    DisableUp -> { model | scrollableUp <- False }
    EnableDown -> { model | scrollableDown <- True }
    EnableUp -> { model | scrollableUp <- True }
    ScrollDown -> model
    ScrollUp -> model

disableDown : Action
disableDown = DisableDown

disableUp : Action
disableUp = DisableUp

enableDown : Action
enableDown = EnableDown

enableUp : Action
enableUp = EnableUp


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div
  [ class "css-scroll-buttons" ]
  [ button
    [ classList [ ("css-button-up", True)
                , ("css-button-disabled", (not model.scrollableUp)) ]
    , onClick address ScrollUp ]
    []
  , button
    [ classList [ ("css-button-down", True)
                , ("css-button-disabled", (not model.scrollableDown)) ]
    , onClick address ScrollDown ]
    [] ]
