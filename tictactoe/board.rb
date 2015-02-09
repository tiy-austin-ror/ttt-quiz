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
      if @squares[location - 1].nil?
        @squares[location - 1] = sym
      end
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
        [3,5,7],
        [1,4,7],
        [2,5,8],
        [3,6,9]
      ]
      lines.each do |line|
        winner = check_line_for_winner line
        return winner if [:x,:o].include?(winner)
      end
      return nil
    end

    def check_line_for_winner line
      # if line.all? { |square| value_at(square) == value_at(line.first) }
      #   unless value_at(line.first).nil?
      #     return value_at(line.first)
      #   end
      # end
      values = line.map { |location| value_at location }
      if values.uniq.count == 1
        return values.first
      end
    end
  end
end
