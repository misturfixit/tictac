require "minitest/autorun"
require_relative "tictactoe_functions.rb"

class TTTTest < Minitest::Test
    # def test_board
    #     board =["1","2","3","4","5","6","7","8","9"]
    #     player = "O"
    #     choice = 2
    #     assert_equal(["1","O","3","4","5","6","7","8","9"], board_change(board,player,choice))
    # end
    # def test_turn
    #     board =["1","2","3","4","5","6","7","8","9"]
    #     player = "O"
    #     choice = 2
    #     assert_equal(["1","O","3","4","5","6","7","8","9"], player_turn(board,player,choice))
    # end
    # def test_other
    #     board =["1","2","3","4","5","6","7","8","9"]
    #     player = "O"
    #     choice = 9
    #     assert_equal(["1","2","3","4","5","6","7","8","O"], player_turn(board,player,choice))
    # end
    # def test_other_turn
    #     board =["1","2","3","4","5","6","7","8","O"]
    #     player = "X"
    #     choice = 4
    #     assert_equal(["1","2","3","X","5","6","7","8","O"], player_turn(board,player,choice))
    # end
    # def test_player_change
    #     board =["1","2","3","4","5","6","7","8","O"]
    #     player = 2
    #     choice = 5
    #     assert_equal(["1","2","3","4","X","6","7","8","O"], player_changer(board,player,choice))
    # end
    # def test_open_space
    #     board =["1","2","3","4","X","6","7","8","O"]
    #     player = "O"
    #     choice = 5
    #     assert_equal(false, space_checker(board,player,choice))
    # end
    # def test_change_player
    #     player1="X"
    #     assert_equal("O", player_check(player1))
    # end
    # def test_full_board
    #     board =["O","X","O","X","X","O","O","O","X"]
    #     assert_equal(true, full_board_check(board))
    # end
    def test_winner_X
        board =
        ["X","2","O",
        "X","5","6",
        "X","O","O"]
        player1="X"
        player2="O"
        winner=""
        assert_equal("Player 1 Won", board_win(board,player1,player2,winner))
    end
end