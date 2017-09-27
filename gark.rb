def board_change(board,player,choice)
    board = ["1","O","3","4","5","6","7","8","9"]
end
def player_turn(board,player,choice)
    board[choice-1] = player
    board
end
def player_changer(board,player,choice)
    if player == 1
        player = "O"
        board[choice-1] = player
        # p board
        board
    elsif player == 2
        player = "X"
        board[choice-1] = player
        # p board
        board
    end
end
def space_checker(board,player,choice)
    if board[choice-1] = "X" || "O"
        false
    else
        true
    end
end
def player_check(player1)
    if player1 == "X"
        player2 = "O"
    elsif player1 == "O"
        player2 = "X"
    end
    p player2
end
def full_board_check(board)
    count = 0
    board.each do |piece|
        if piece == "X" || "O"
            count+1
        else
            count+0
        end
    end
    if count == 9
        p true
    else
        p false
    end
end
def combos(board)
    [[board[0], board[1], board[2]],
    [board[0], board[4], board[8]],
    [board[0], board[3], board[6]],
    [board[3], board[4], board[5]],
    [board[6], board[7], board[8]],
    [board[6], board[4], board[2]],
    [board[1], board[4], board[7]],
    [board[2], board[5], board[8]]]
end
def board_win(board,player1,player2,winner)
    winner = ""
    combos(board).each do |combin|
        if combin[0] == player1 && combin[1] == player1 && combin[2] == player1
            winner = "Player 1 Won"
        elsif combin[0] == player2 && combin[1] == player2 && combin[2] == player2
            winner = "Player 2 Won"
        end
    end
    p winner
end

# p "#{board[0]}|#{board[1]}|#{board[2]}"
# p "-|-|-"
# p "#{board[3]}|#{board[4]}|#{board[5]}"
# p "-|-|-"
# p "#{board[6]}|#{board[7]}|#{board[8]}"
# 0|1|2
#-------
# 3|4|5
#-------
# 6|7|8