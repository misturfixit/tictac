class Board

	attr_accessor :board
	def	initialize()
			@board = ["1","2","3","4","5","6","7","8","9"]
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def ud(choice,player)
		@board[choice-1] = player
			
	end	
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###

end	