module Jedi (init, listing, Model, template) where

import Html exposing (..)
import Html.Attributes exposing (..)


-- MAIN
--
-- main =
--   template [ (listing "Name" "World")
--            , blankJedi
--            , (listing "Name" "World") ]


-- MODEL

type alias Model = List Jedi
type alias Jedi =
  { home : String
  , name : String }

init : Model
init = []

listing : String -> String -> Jedi
listing name home = Jedi home name


-- TEMPLATE

template : Model -> Html
template model =
  ul [ class "css-slots" ] (List.map oneJedi (padList model blankJedi 5))

oneJedi : Jedi -> Html
oneJedi jedi =
  let home = if (jedi == blankJedi) then emptyText
              else [ text ("Homeworld: " ++ jedi.home) ]
      name = if (jedi == blankJedi) then emptyText
              else [ text jedi.name ]
   in
     li [ class "css-slot" ] [ h3 [] name, h6 [] home ]

blankJedi : Jedi
blankJedi = listing "" ""

emptyText : List Html
emptyText = [ text "" ]

padList : (List a) -> a -> Int -> List a
padList list pad length =
  let list' = (List.take length list)
      length' = (List.length list')
  in
    if length' < length
    then List.append list' (List.repeat (length - length') pad)
    else list'


-- regarding a non-breaking space:
-- see: https://github.com/evancz/elm-html/issues/54
-- in this case, though, styles prevent the li from shrinking undesirably when
-- the text node is empty
