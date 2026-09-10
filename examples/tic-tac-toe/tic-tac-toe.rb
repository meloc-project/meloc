class TicTacToe
  Symbol = [:X, :O]

  def initialize
    @board = Array.new(9)
    @current_player = :X
    @winner = nil
    @is_game_over = false
  end

  def mark(index)
    raise "Game is over" if @is_game_over
    raise "Index out of range" if index < 0 || index > 8
    raise "Cell is already occupied" if @board[index]

    @board[index] = @current_player
    @winner = get_winner

    if @winner || @board.all?
      @is_game_over = true
    else
      @current_player = @current_player == :X ? :O : :X
    end
  end

  private

  def get_winner
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ].each do |a, b, c|
      if @board[a] && @board[a] == @board[b] && @board[b] == @board[c]
        return @board[a]
      end
    end

    nil
  end
end
