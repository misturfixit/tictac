class Playerunbeets
  
  attr_accessor :marker 
  ###(((((()))((((((()))))((((((Init))))))(((((()))(((((())))))))))###
	def initialize(marker)
		@marker = marker
	end
  ###(((((()))((((((()))))((((((WinBlock))))))(((((()))(((((())))))))))###
  ###(((((()))((((((()))))((((((Win_Func))))))(((((()))(((((())))))))))###
  def win_move(board)
    @board = board
    choice = []
    # p "#{board}dahells my board doooooinnnggggg????"
    board.board.each_with_index do |op_spot,index|
      #p op_spot
      #p index 
      if op_spot == "#{index + 1}"
          @board.place_marker(@marker,op_spot)
          if @board.winr(@board) == true
            choice = op_spot
          end
          @board.place_marker("#{index + 1}", "#{index + 1}")     
        end
      end 
      if choice == []
        false
      else
        choice
      end     
    end  
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))((((((FirstMove))))))(((((()))(((((())))))))))###
  def f_move(board)	
    choice = []
    if board.include?("o") || board.include?("x") == true   
      board.each_with_index do |val,index|
        if	val != "#{index+1}"
        if index%2 == 1
          if index == 1 || index == 3
              choice = 0
            elsif index == 7 || index == 5
              choice = 8
            end     
          elsif index%2 == 0 && index != 4
            choice = 4   
          else   
            choice = 6 
          end   
        end
      end  
    else
      choice = 4     
    end
    f_move = "#{choice+1}"
    f_move
  end	
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))((((((SecMove))))))(((((()))(((((())))))))))###
  def sec_move(board)
    op_spot = []
    playa_x = []
    playa_o = []

      board.each_with_index do |marked, index|
        if marked == "x"
          playa_x << index
        elsif marked == "o"
          playa_o << index
        else marked == ""
          op_spot << index
        end
      end
  end  
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
end 
