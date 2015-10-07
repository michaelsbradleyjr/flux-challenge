import Debug
import Html exposing (..)
import Html.Attributes exposing (class, href, rel, style)
import Html.Events exposing (onClick)
import StartApp.Simple exposing (start)
import String


-- MAIN

main =
  start
    { model =
        { darkJedi = List.repeat 5 {name = "", home = ""}
        , world  = "..."
        , pendingRequests = [ "" ]
        , scrollDownClass = " css-button-disabled"
        , scrollUpClass   = " css-button-disabled"
        }
    , update = update
    , view = view
    }


-- MODEL

type alias Model =
  { darkJedi: List { name : String
                   , home : String
                   }
  , pendingRequests : List String
  , scrollDownClass : String
  , scrollUpClass : String
  , world : String
  }


-- UPDATE

type Action
  = Increment
  | Decrement

update : Action -> Model -> Model
update action model =
  model
  -- case action of
  --   Increment -> model + 1
  --   Decrement -> model - 1


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div
    [ class "app-container" ]
    [ css "styles.css"
    , div
        [ class "css-root" ]
        [ h1
            [ class "css-planet-monitor" ]
            [ text ("Obi-Wan currently on " ++ model.world) ]
        , section
            [ class "css-scrollable-list" ]
            [ ul
                [ class "css-slots" ]
                (List.map
                  (\jedi ->
                     let  {name,home} = jedi
                     in
                       li
                         [ class "css-slot" ]
                         [ h3 [] [ text name ]
                         , h6 [] [ text (if String.isEmpty home
                                           then ""
                                           else "Homeworld: " ++ home) ]
                        ])
                    model.darkJedi)
            , div
                [ class "css-scroll-buttons" ]
                [ button
                    [ class ("css-button-up"   ++ model.scrollUpClass) ] []
                , button
                    [ class ("css-button-down" ++ model.scrollDownClass) ] []
                ]
            ]
        ]
    ]

css : String -> Html
css path =
  node "link" [ rel "stylesheet", href path ] []

-- div []
--   [ css "styles.css"
--   , button [ onClick address Decrement ] [ text "-" ]
--   , div [ countStyle ] [ text (toString model) ]
--   , button [ onClick address Increment ] [ text "+" ]
--   ]

     -- countStyle : Attribute
-- countStyle =
--   style
--     [ ("font-size", "20px")
--     , ("font-family", "monospace")
--     , ("display", "inline-block")
--     , ("width", "50px")
--     , ("text-align", "center")
--     ]
