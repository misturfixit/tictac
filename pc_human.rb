class Playerhuman
  attr_accessor :marker
  def initialize(marker)
    @marker = marker
  end
  def move(board)
    # p 
    # p "OK Human...Pick a spot...1-9"
    choice = gets.chomp.to_i
  end
end      