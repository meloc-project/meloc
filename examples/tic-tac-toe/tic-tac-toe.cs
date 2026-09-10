enum Symbol { X, O }

record Game(
    List<Symbol?> Board,
    Symbol CurrentPlayer,
    Symbol? Winner,
    bool IsGameOver
);

static Symbol NextPlayer(Symbol player) =>
    player == Symbol.X ? Symbol.O : Symbol.X;

static Symbol? GetWinner(List<Symbol?> board)
{
    int[][] lines =
    [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ];

    foreach (var line in lines)
    {
        var x = board[line[0]];
        var y = board[line[1]];
        var z = board[line[2]];

        if (x.HasValue && x == y && y == z)
            return x;
    }

    return null;
}

static Game Mark(Game game, int index)
{
    var board = new List<Symbol?>(game.Board);
    board[index] = game.CurrentPlayer;

    var winner = GetWinner(board);

    return new Game(
        board,
        NextPlayer(game.CurrentPlayer),
        winner,
        winner.HasValue || board.TrueForAll(cell => cell.HasValue)
    );
}
