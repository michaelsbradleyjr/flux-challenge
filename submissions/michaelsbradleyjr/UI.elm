-- module UI (init, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Jedi
import Scroll
import StartApp.Simple
import World


-- MAIN
--
-- main = view (Signal.mailbox (Click Scroll.disableUp)).address init
main = StartApp.Simple.start
       { model = init, update = update, view = view }


-- MODEL

type alias Model =
  { displayJedi : Jedi.Model
  , displayWorld : World.Model
  , scrollStates : Scroll.Model }

init : Model
init =
  { displayJedi = Jedi.init
  , displayWorld = World.init
  , scrollStates = Scroll.init }


-- UPDATE

type Action
  = Click Scroll.Action

update : Action -> Model -> Model
update action model =
  model


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div
  [ class "app-container" ]
  [ css "styles.css"
  , div
    [ class "css-root" ]
    [ World.template model.displayWorld
    , section
      [ class "css-scrollable-list" ]
      [ Jedi.template model.displayJedi
      , Scroll.view (Signal.forwardTo address Click) model.scrollStates ] ] ]


css : String -> Html
css path =
  node "link" [ rel "stylesheet", href path ] []
