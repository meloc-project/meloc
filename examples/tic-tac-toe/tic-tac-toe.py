from dataclasses import dataclass
from enum import Enum


class Symbol(Enum):
    X = "X"
    O = "O"


@dataclass
class Game:
    board: list[Symbol | None]
    current_player: Symbol
    winner: Symbol | None
    is_game_over: bool


def next_player(player):
    return Symbol.O if player == Symbol.X else Symbol.X


def get_winner(board):
    lines = [
        (0, 1, 2), (3, 4, 5), (6, 7, 8),
        (0, 3, 6), (1, 4, 7), (2, 5, 8),
        (0, 4, 8), (2, 4, 6),
    ]

    for a, b, c in lines:
        x, y, z = (board[a], board[b], board[c])

        if x is not None and x == y == z:
            return x

    return None


def mark(game, index):
    board = game.board.copy()
    board[index] = game.current_player
    winner = get_winner(board)

    return Game(
        board,
        next_player(game.current_player),
        winner,
        winner is not None or all(cell is not None for cell in board),
    )
