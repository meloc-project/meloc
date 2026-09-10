type Symbol {
  X
  O
}

type Game {
  board: List(Symbol?)
  current_player: Symbol
  winner: Symbol?
  is_game_over: Bool
}

fn mark(game: Game, index: Int) -> Game {
  let board = List.replace(game.board, index, Some(game.current_player))
  let winner = get_winner(board)

  Game(
    board: board,
    current_player: get_next_player(game.current_player),
    winner: winner,
    is_game_over: winner != None || List.all(board, fn(cell) { cell != None }),
  )
}

fn get_next_player(current_player: Symbol) -> Symbol {
  case current_player {
      X -> O
      O -> X
    }
}

fn get_winner(board: List(Symbol?)) -> Symbol? {
  let lines = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // horizontal
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // vertical
    [0, 4, 8], [2, 4, 6], // diagonal
  ]

  lines
  |> List.find_map(fn(line) {
    case line {
      [a, b, c] ->
        case { List.at(board, a), List.at(board, b), List.at(board, c) } {
          {
            Ok(Some(x)),
            Ok(Some(y)),
            Ok(Some(z)),
          }
          if x == y && y == z -> Some(x)
          _ -> None
        }
      _ -> None
    }
  })
}
