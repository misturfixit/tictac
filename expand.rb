def	board_size()
p "Pick your board size"
  boardMultiplier = gets.chomp.to_i
  board = Array.new((boardMultiplier * boardMultiplier), "XOOX")
    board.each_slice(boardMultiplier) do |show|
      p show 
      puts 
    end
  
# p board
# p "#{boardDim}"
  
  # 
  
end

board_size()


# i = 0
# end  
#   while (i < board.length)
#     puts board[i].to_s + "TAKTOE"
#     i += 1
#   end
