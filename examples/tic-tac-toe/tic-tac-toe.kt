enum class Symbol {
    X, O
}

data class Game(
    val board: List<Symbol?>,
    val currentPlayer: Symbol,
    val winner: Symbol?,
    val isGameOver: Boolean
)

fun nextPlayer(player: Symbol) =
    if (player == Symbol.X) Symbol.O else Symbol.X

fun getWinner(board: List<Symbol?>): Symbol? {
    val lines = listOf(
        listOf(0, 1, 2), listOf(3, 4, 5), listOf(6, 7, 8),
        listOf(0, 3, 6), listOf(1, 4, 7), listOf(2, 5, 8),
        listOf(0, 4, 8), listOf(2, 4, 6)
    )

    for ((a, b, c) in lines) {
        val x = board[a]
        val y = board[b]
        val z = board[c]

        if (x != null && x == y && y == z)
            return x
    }

    return null
}

fun mark(game: Game, index: Int): Game {
    val board = game.board.toMutableList()
    board[index] = game.currentPlayer

    val winner = getWinner(board)

    return Game(
        board,
        nextPlayer(game.currentPlayer),
        winner,
        winner != null || board.all { it != null }
    )
}
