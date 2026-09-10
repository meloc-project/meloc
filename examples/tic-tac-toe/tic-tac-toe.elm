type Symbol = X | O


type alias Game =
    { board : List (Maybe Symbol)
    , currentPlayer : Symbol
    , winner : Maybe Symbol
    , isGameOver : Bool
    }


mark : Game -> Int -> Game
mark game index =
    let
        board =
            List.indexedMap
                (\i cell ->
                    if i == index then
                        Just game.currentPlayer

                    else
                        cell
                )
                game.board

        winner =
            getWinner board
    in
    { board = board
    , currentPlayer = getNextPlayer game.currentPlayer
    , winner = winner
    , isGameOver =
        winner /= Nothing
            || List.all (\cell -> cell /= Nothing) board
    }


getNextPlayer : Symbol -> Symbol
getNextPlayer currentPlayer =
    case currentPlayer of
        X ->
            O

        O ->
            X


getWinner : List (Maybe Symbol) -> Maybe Symbol
getWinner board =
    let
        lines =
            [ [ 0, 1, 2 ]
            , [ 3, 4, 5 ]
            , [ 6, 7, 8 ]
            , [ 0, 3, 6 ]
            , [ 1, 4, 7 ]
            , [ 2, 5, 8 ]
            , [ 0, 4, 8 ]
            , [ 2, 4, 6 ]
            ]

        winner line =
            case line of
                [ a, b, c ] ->
                    case ( get a board, get b board, get c board ) of
                        ( Just x, Just y, Just z ) ->
                            if x == y && y == z then
                                Just x

                            else
                                Nothing

                        _ ->
                            Nothing

                _ ->
                    Nothing
    in
    List.filterMap winner lines
        |> List.head


get : Int -> List a -> Maybe a
get index list =
    List.drop index list
        |> List.head
