require 'minitest/autorun'

require_relative './tictactoe'

class TicTacToeTests < MiniTest::Test
  def assert_equal_mod_space str1, str2
    assert_equal str1.gsub(/\s/, ''), str2.gsub(/\s/, '')
  end

  def test_players_have_a_symbol
    me = TicTacToe::Player.new "james", :x
    assert_equal me.symbol, :x
  end

  def test_can_display_the_board
    board = TicTacToe::Board.new
    assert_equal_mod_space board.to_s, <<-BOARD
      -------
      |1|2|3|
      -------
      |4|5|6|
      -------
      |7|8|9|
      -------
    BOARD
  end

  def test_can_place_symbols_on_board
    board = TicTacToe::Board.new
    board.place :x, 2
    board.place :o, 6
    assert_equal_mod_space board.to_s, <<-BOARD
      -------
      |1|x|3|
      -------
      |4|5|o|
      -------
      |7|8|9|
      -------
    BOARD
    assert_equal board.winner, nil
  end

  def test_board_disallows_duplicate_moves
    board = TicTacToe::Board.new
    board.place :x, 4
    board.place :o, 4
    assert_equal_mod_space board.to_s, <<-BOARD
      -------
      |1|2|3|
      -------
      |x|5|6|
      -------
      |7|8|9|
      -------
    BOARD
    assert_equal board.winner, nil
  end

  def test_board_can_find_diagonals
    board = TicTacToe::Board.new
    board.place :x, 7
    board.place :o, 1
    board.place :x, 5
    board.place :o, 2
    board.place :x, 3
    assert_equal board.winner, :x
  end

  def test_board_can_find_columns
    board = TicTacToe::Board.new
    board.place :x, 9
    board.place :o, 5
    board.place :x, 3
    board.place :o, 2
    board.place :x, 6
    assert_equal board.winner, :x
  end
end
