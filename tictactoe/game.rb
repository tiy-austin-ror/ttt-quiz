module TicTacToe
  class Game
    def initialize name1, name2
      @board = Board.new
      @players = [
        Player.new(name1, :x),
        Player.new(name2, :o)
      ]
    end

    def play!
      loop do
        @players.each do |player|
          location = player.get_move @board
          @board.place player.symbol, location
          return if @board.winner || @board.full?
        end
      end
    end

    def winner
      @players.find { |p| p.symbol == @board.winner }
    end
  end
end
