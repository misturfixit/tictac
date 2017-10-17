class Playerseq

	attr_accessor :marker 
	###(((((()))((((((()))))((((((INIT))))))(((((()))(((((())))))))))###
	def initialize(marker)
		@marker = marker
	end
	###(((((()))((((((()))))((((((MOVE))))))(((((()))(((((())))))))))###
	def move(board)	
		ind = []
		board.each_with_index do |val,index|
		  if val == "x" 
		  elsif val == "o"
		  
		  else 
		  	ind << index+1
		 end	
		# p"#{val}....valuuuuueeeee"
		# p "#{index}.....indexxxxxxx"	
	  end
ind.first
	end
end



		