class Playerunbeets
  
  attr_accessor :marker, :name 
###(((((()))((((((()))))((((((Init))))))(((((()))(((((())))))))))###
	def initialize(marker, name)
    @marker = marker
    @name = name
	end
###(((((()))((((((()))))((((((WinBlockFunc))))))(((((()))(((((())))))))))###  
  def win_move(board)
      
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
            # p "_____________________markeris_____#{@marker}_IS HERREE______________________________"
            # p "___OTHERMARKER__________#{other_marker}_________________HERE___________________________"
        end
      end
      choice+1
    end
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def block_move(board, other_marker)
     
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
            if  vals.count(other_marker) == 2 && vals.count("") == 1
              win = vals.index("")
              choice = winnums[index][win]    
                # p "_____________________markeris_____#{@marker}_IS HERREE______________________________"
                # p "___OTHERMARKER__________#{other_marker}_________________HERE___________________________"
            end
          end
          choice+1
        end
  # p "_________________________________________________________"

  ###(((((()))((((((()))))((((((FirstMove))))))(((((()))(((((())))))))))###
  def f_move(board)	
    corner = [0,2,6,8]    ###  corner spots
    edge = [1,3,5,7]     ###  edge spots
    choice = 0        ###  def. choice

    if corner.any? {|a| board[a] == "x"}  ###  checking for filled corner spots 
         choice = 5
    elsif board[4] == "x"
         choice = 1
    else edge.any? {|a| board[a] == "x"}   ###  checking for filled edge spots
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
  def get_edge(board, other_marker)
      
    board_diag =  [
        [board[0], board[4], board[8]],    
        [board[2], board[4], board[6]]]
 
        choice = 13
        
      board_diag.each_with_index do |vals, index|
        if vals.count(@marker) == 1 && vals.count(other_marker) == 2
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
    choice = 10
    
    if one_eight.all? {|a| board[a] == @marker}
         choice = 6
    elsif one_six.all? {|a| board[a] == @marker}
      if board[2] == ''
         choice = 3
      else choice = free(board)
      end
    elsif three_eight.all? {|a| board[a] == @marker}
      if board[8] == ''
         choice = 9
      else choice = free(board)
      end
    elsif three_four.all? {|a| board[a] == @marker}
      if board[0] == ''
         choice = 1
      else choice = free(board)
      end
    elsif seven_two.all? {|a| board[a] == @marker}
         choice = 1
    elsif seven_six.all? {|a| board[a] == @marker}
      if board[2] == ''
         choice = 3
      else choice = free(board)
      end
    elsif nine_two.all? {|a| board[a] == @marker}
      if board[0] == ''
         choice = 1
      else choice = free(board)
      end
    else nine_four.all? {|a| board[a] == @marker}
      choice = 1
   end
    choice
  end
###(((((()))((((((()))))((((((MoveFunc))))))(((((()))(((((())))))))))###   
  def move(board)
      if @marker == "x"
        other_marker = "o" 
      else 
        other_marker = "x"
      end    
   #  puts "def move board is firing.................!!!!!!!!!!!!!!!"
    choice = 13
    if board.count("x") <= 1
        puts  "_______FIRSTMOVE________  is firing.................!!!!!!!!!!!!!!!"
        choice = f_move(board)
    elsif win_move(board) <= 9
        puts  "_______WINMOVE_________  is firing.................!!!!!!!!!!!!!!!"
        choice = win_move(board)
    elsif block_move(board, other_marker) <= 9
        puts  "_______BLOCKMOVE____________  is firing.................!!!!!!!!!!!!!!!"
        choice = block_move(board, other_marker)
    elsif get_edge(board, other_marker) <= 9
        puts  "_______EDGEMOVE____________  is firing.................!!!!!!!!!!!!!!!"
        choice = get_edge(board,other_marker)
    elsif sec_move(board) <= 9
        puts  "_______SECONDMOVE_________  is firing.................!!!!!!!!!!!!!!!"
        choice = sec_move(board)
    else free(board) <= 9
        choice = free(board) 
    end
   choice
  end
end 
  
  
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  
 
