class Playerunbeets
  
  attr_reader :marker 
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	def initialize(marker)
		@marker = marker
	end
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###

###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def f_move(board)	
    pick = []
    if board.include?("o") || board.include?("x") == true   
   		board.each_with_index do |val,index|
        if	val != "#{index+1}"
          if index%2 == 1
            if index == 1 || index == 3
              pick = 0
            elsif index == 7 || index == 5
              pick = 8
            end     
          elsif index%2 == 0 && index != 4
            pick = 4   
          else   
            pick = 6 
          end   
        end
      end  
    else
      pick = 4     
    end
    f_move = "#{pick+1}"
    f_move
  end	


###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###


end 





# 		   elsif val == "o"
		  
# 		  else 
# 		  	ind << index+1
# 		 end	
# 	  end
# ind.sample    