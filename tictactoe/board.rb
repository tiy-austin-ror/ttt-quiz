module TicTacToe
  class Board
    def initialize
      @squares = [nil] * 9
    end

    def to_s
      rows = 0.upto(8).each_slice 3
      divider = "-" * 7 + "\n"
      result = divider
      rows.each do |row|
        result += format_row(row) + "\n"
        result += divider
      end
      result
    end

    def format_row row
      squares = row.map { |n| @squares[n] || (n + 1).to_s }
      '|' + squares.join('|') + '|'
    end

    def value_at location
      @squares[location - 1]
    end

    def place sym, location
      @squares[location - 1] = sym
    end

    def full?
      @squares.none? { |n| n.nil? }
    end

    def winner
      lines = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,5,9],
        [3,5,7]
      ]
      lines.each do |line|
        if line.all? { |square| value_at(square) == value_at(line.first) }
          return value_at(line.first)
        end
      end
      return nil
    end
  end
end
