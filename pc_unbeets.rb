class Playerunbeets
  
  attr_accessor :marker 
###(((((()))((((((()))))((((((Init))))))(((((()))(((((())))))))))###
	def initialize(marker)
		@marker = marker
	end
###(((((()))((((((()))))((((((//Win_Func//))))))(((((()))(((((())))))))))###
###(((((()))((((((()))))((((((WinBlockFunc))))))(((((()))(((((())))))))))###  
  def win_move(board)
   # p "#{board}....boardheeeree/....././../.."
    board_state = [
      [board[0],board[1],board[2]],
      [board[3],board[4],board[5]],
      [board[6],board[7],board[8]],
      [board[0],board[3],board[6]],
      [board[1],board[4],board[7]],
      [board[2],board[5],board[8]],
      [board[0],board[4],board[8]],
      [board[2],board[4],board[6]]]
      
      winnums = [[0,1,2], [3,4,5], 
        [6,7,8], [0,3,6], [1,4,7], 
        [2,5,8], [0,4,8], [2,4,6]]
      choice = 13
      board_state.each_with_index do |vals, index|
        if  vals.count(@marker) == 2 && vals.count("") == 1
            win = vals.index("")
            choice = winnums[index][win]
        elsif  vals.count("x") == 2 && vals.count("") == 1
          win = vals.index("")
          choice = winnums[index][win]    
        end
      end
      choice+1
    end
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))((((((FirstMove))))))(((((()))(((((())))))))))###
  def f_move(board)	
    corner = [0,2,6,8]
    edge = [1,3,5,7]
    choice = 0

    if corner.any? {|a| board[a] == "x"}
         choice = 5
    elsif board[4] == "x"
         choice = 1
    else edge.any? {|a| board[a] == "x"}
         choice = 5
    end
  end  
###(((((()))((((((()))))((((((FreeChoice))))))(((((()))(((((())))))))))###    
  def free(board)
      choice = 13
      ospot = []
    board.each_with_index do |val, i|
      if val == ''
      ospot << i
      end
    end
      choice = ospot.sample
  end

###(((((()))((((((()))))((((((EdgeMove))))))(((((()))(((((())))))))))###
  def get_edge(board)
      
    board_diag =  [
        [board[0], board[4], board[8]],
        [board[2], board[4], board[6]]]
 
        choice = 13
        
      board_diag.each_with_index do |vals, index|
        if vals.count("o") == 1 && vals.count("x") == 2
          if  board[1] == ""
            choice = 2
          elsif board[3] == ""
            choice = 4
          elsif board[5] == ""
            choice = 6
          else board[7] == ""
            choice = 8
          end
        end
      end
    choice
  end
###(((((()))((((((()))))((((((SecMove))))))(((((()))(((((())))))))))###
  def sec_move(board)
    
    one_eight = [0,7]
    one_six = [0,5]
    three_eight = [2,7]
    three_four = [3,4]
    seven_two = [1,6]
    seven_six = [5,6]
    nine_two = [1,8]
    nine_four = [3,8]
    choice = 13
    
    if one_eight.all? {|a| board[a] == "x"}
         choice = 6
    elsif one_six.all? {|a| board[a] == "x"}
      if board[2] == ''
         choice = 3
      else choice = free(board)
      end
    elsif three_eight.all? {|a| board[a] == "x"}
      if board[8] == ''
         choice = 9
      else choice = free(board)
      end
    elsif three_four.all? {|a| board[a] == "x"}
      if board[0] == ''
         choice = 1
      else choice = free(board)
      end
    elsif seven_two.all? {|a| board[a] == "x"}
         choice = 1
    elsif seven_six.all? {|a| board[a] == "x"}
      if board[2] == ''
         choice = 3
      else choice = free(board)
      end
    elsif nine_two.all? {|a| board[a] == "x"}
      if board[0] == ''
         choice = 1
      else choice = free(board)
      end
    else nine_four.all? {|a| board[a] == "x"}
      choice = 1
   end
    choice
  end
###(((((()))((((((()))))((((((MoveFunc))))))(((((()))(((((())))))))))###   
  def move(board)
   #  puts "def move board is firing.................!!!!!!!!!!!!!!!"
    choice = 13
    if board.count("x") <= 1
      puts  "f___ move  is firing.................!!!!!!!!!!!!!!!"
         choice = f_move(board)
    elsif win_move(board) <= 9
      puts  "WIN__ move  is firing.................!!!!!!!!!!!!!!!"
         choice = win_move(board)
    elsif get_edge(board) <= 9
      puts  "_EDGE_ move  is firing.................!!!!!!!!!!!!!!!"
         choice = get_edge(board)
    elsif sec_move(board) <= 9
      puts  "SEC__ move board is firing.................!!!!!!!!!!!!!!!"
         choice = sec_move(board)
    else free(board) <= 9
         choice = free(board) 
    end
   choice
  end
end 
  
  
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  
 
#   choice = []
#   # p "#{board}ver my board????yarrrfffff........................"
#   if board.include?("o") || board.include?("x") == true   
#     board.each_with_index do |val,index|
#       if	val != "#{index+1}"
#         if index %2 == 1
#           if index == 1 || index == 3
#               choice = 0
#           elsif index == 7 || index == 5
#             choice = 8
#           else  index == 4 || index == 6
#             choice = 7
#           end     
#         elsif index %2 == 0 && index != 4
#             choice = 4   
#         else   
#             choice = 6 
#         end   
#       end
#     end  
#   else
#     choice = 4     
#   end
#   f_move = "#{choice+1}"
#   f_move
# end	