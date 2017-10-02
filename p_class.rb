class Playerseq

	attr_reader :player 
	###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	def initialize(marker)
		@player = marker
	end
	###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	def move(board)	
		ind = []
		board.each_with_index do |val,index|
		  if	val == "x" 
		   elsif val == "o"
		  # 	ind << 11
		  else 
		  	ind << index+1
		 end	
		# p"#{val}....valuuuuueeeee"
		# p "#{index}.....indexxxxxxx"	
	  end
ind.first
	end	
	###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###

	###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	
end



		