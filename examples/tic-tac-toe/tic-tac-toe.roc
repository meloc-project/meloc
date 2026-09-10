Symbol := [X, O]

Game := {
    board : List(Symbol?),
    current_player : Symbol,
    winner : Symbol?,
    is_game_over : Bool,
}

mark = |game, index| {
    board = game.board.set(index, game.current_player)
    winner = get_winner(board)

    {
        board,
        current_player: get_next_player(game.current_player),
        winner,
        is_game_over: winner != None || board.all(|cell| cell != None),
    }
}

get_next_player = |current_player|
    match current_player {
        X => O
        O => X
    }

get_winner = |board| {
    lines = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6],
    ]

    lines
        .keep_if(|line| line.len() == 3)
        .map(|line|
            match line {
                [a, b, c] =>
                    match { board.get(a), board.get(b), board.get(c) } {
                        { Ok(Some(x)), Ok(Some(y)), Ok(Some(z)) } if x == y && y == z =>
                            Some(x)
                        _ => None
                    }
                _ => None
            }
        )
        .first()
        ?? None
}
