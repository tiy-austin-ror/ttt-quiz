module TicTacToe
  class Player
    attr_reader :name, :symbol

    def initialize name, symbol
      @name, @symbol = name, symbol
    end

    def get_move board
      system "clear"
      puts board
      print "#{@symbol} > "
      gets.chomp.to_i
    end
  end
end
