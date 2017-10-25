class Playerrand
  
  attr_accessor :marker, :name 
###(((((()))((((((()))))((((((INIT))))))(((((()))(((((())))))))))###
	def initialize(marker, name)
    @marker = marker
    @name = name
	end
###(((((()))((((((()))))((((((MOVE))))))(((((()))(((((())))))))))###
	def move(board)	
		ind = []
		board.each_with_index do |val,index|
		  if	val == "x" 
		   elsif val == "o"		  
		  else 
		  	ind << index+1
		 end	
	  end
ind.sample    
	end	
end 