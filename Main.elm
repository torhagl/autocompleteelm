module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events as Events exposing (..)
import Regex exposing (..)


main =
    Html.program
        { init = init, view = view, update = update, subscriptions = subscriptions }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( model, Cmd.none )



-- MODL


type alias Model =
    { input : String
    , db : List String
    }


model : Model
model =
    { db = []
    , input = ""
    }



-- UPDATE


type Msg
    = Input String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Input s ->
            ( { model | input = s }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "grid" ]
        [ div [ class "row" ]
            [ div
                [ class "col col-12" ]
                [ input [ placeholder "Start typing!", Events.onInput Input ] []
                , div []
                    [ if model.input == "" then
                        text "Results come here!"
                      else
                        viewAlternatives model.input db
                    ]
                ]
            ]
        ]


viewAlternatives : String -> List String -> Html Msg
viewAlternatives input db =
    div [] <| List.take 15 <| List.map (\y -> div [ class "alternative" ] [ Html.text y ]) (List.filter (Regex.contains (Regex.caseInsensitive <| regex <| "^" ++ input)) db)


db : List String
db =
    [ "a"
    , "about"
    , "above"
    , "above"
    , "across"
    , "after"
    , "afterwards"
    , "again"
    , "against"
    , "all"
    , "almost"
    , "alone"
    , "along"
    , "already"
    , "also"
    , "although"
    , "always"
    , "am"
    , "among"
    , "amongst"
    , "amoungst"
    , "amount"
    , "an"
    , "and"
    , "another"
    , "any"
    , "anyhow"
    , "anyone"
    , "anything"
    , "anyway"
    , "anywhere"
    , "are"
    , "around"
    , "as"
    , "at"
    , "back"
    , "be"
    , "became"
    , "because"
    , "become"
    , "becomes"
    , "becoming"
    , "been"
    , "before"
    , "beforehand"
    , "behind"
    , "being"
    , "below"
    , "beside"
    , "besides"
    , "between"
    , "beyond"
    , "bill"
    , "both"
    , "bottom"
    , "but"
    , "by"
    , "call"
    , "can"
    , "cannot"
    , "cant"
    , "co"
    , "con"
    , "could"
    , "couldnt"
    , "cry"
    , "de"
    , "describe"
    , "detail"
    , "do"
    , "done"
    , "down"
    , "due"
    , "during"
    , "each"
    , "eg"
    , "eight"
    , "either"
    , "eleven"
    , "else"
    , "elsewhere"
    , "empty"
    , "enough"
    , "etc"
    , "even"
    , "ever"
    , "every"
    , "everyone"
    , "everything"
    , "everywhere"
    , "except"
    , "few"
    , "fifteen"
    , "fify"
    , "fill"
    , "find"
    , "fire"
    , "first"
    , "five"
    , "for"
    , "former"
    , "formerly"
    , "forty"
    , "found"
    , "four"
    , "from"
    , "front"
    , "full"
    , "further"
    , "get"
    , "give"
    , "go"
    , "had"
    , "has"
    , "hasnt"
    , "nigger"
    , "niggerfaggot"
    , "have"
    , "he"
    , "hence"
    , "her"
    , "here"
    , "hereafter"
    , "hereby"
    , "herein"
    , "hereupon"
    , "hers"
    , "herself"
    , "him"
    , "himself"
    , "his"
    , "how"
    , "however"
    , "hundred"
    , "ie"
    , "if"
    , "in"
    , "inc"
    , "indeed"
    , "interest"
    , "into"
    , "is"
    , "it"
    , "its"
    , "itself"
    , "keep"
    , "last"
    , "latter"
    , "latterly"
    , "least"
    , "less"
    , "ltd"
    , "made"
    , "many"
    , "may"
    , "me"
    , "meanwhile"
    , "might"
    , "mill"
    , "mine"
    , "more"
    , "moreover"
    , "most"
    , "mostly"
    , "move"
    , "much"
    , "must"
    , "my"
    , "myself"
    , "name"
    , "namely"
    , "neither"
    , "never"
    , "nevertheless"
    , "next"
    , "nine"
    , "no"
    , "nobody"
    , "none"
    , "noone"
    , "nor"
    , "not"
    , "nothing"
    , "now"
    , "nowhere"
    , "of"
    , "off"
    , "often"
    , "on"
    , "once"
    , "one"
    , "only"
    , "onto"
    , "or"
    , "other"
    , "others"
    , "otherwise"
    , "our"
    , "ours"
    , "ourselves"
    , "out"
    , "over"
    , "own"
    , "part"
    , "per"
    , "perhaps"
    , "please"
    , "put"
    , "rather"
    , "re"
    , "same"
    , "see"
    , "seem"
    , "seemed"
    , "seeming"
    , "seems"
    , "serious"
    , "several"
    , "she"
    , "should"
    , "show"
    , "side"
    , "since"
    , "sincere"
    , "six"
    , "sixty"
    , "so"
    , "some"
    , "somehow"
    , "someone"
    , "something"
    , "sometime"
    , "sometimes"
    , "somewhere"
    , "still"
    , "such"
    , "system"
    , "take"
    , "ten"
    , "than"
    , "that"
    , "the"
    , "their"
    , "them"
    , "themselves"
    , "then"
    , "thence"
    , "there"
    , "thereafter"
    , "thereby"
    , "therefore"
    , "therein"
    , "thereupon"
    , "these"
    , "they"
    , "thickv"
    , "thin"
    , "third"
    , "this"
    , "those"
    , "though"
    , "three"
    , "through"
    , "throughout"
    , "thru"
    , "thus"
    , "to"
    , "together"
    , "too"
    , "top"
    , "toward"
    , "towards"
    , "twelve"
    , "twenty"
    , "two"
    , "un"
    , "under"
    , "until"
    , "up"
    , "upon"
    , "us"
    , "very"
    , "via"
    , "was"
    , "we"
    , "well"
    , "were"
    , "what"
    , "whatever"
    , "when"
    , "whence"
    , "whenever"
    , "where"
    , "whereafter"
    , "whereas"
    , "whereby"
    , "wherein"
    , "whereupon"
    , "wherever"
    , "whether"
    , "which"
    , "while"
    , "whither"
    , "who"
    , "whoever"
    , "whole"
    , "whom"
    , "whose"
    , "why"
    , "will"
    , "with"
    , "within"
    , "without"
    , "would"
    , "yet"
    , "you"
    , "your"
    , "yours"
    , "yourself"
    , "yourselves"
    , "the"
    ]
