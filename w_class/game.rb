require_relative "console.rb"

$game = Console.new
#  $game = run
p
p
p
puts    "_______________       ___                 ______________"
puts    "\\__     __/|__|_\_____/  |_________________\\___      ___/ "
puts     "  |    |   |  |/  __/   ____/__    //   __/  |    |  ____________"    
puts     "  |    |   |  \\  \\__    __/  __   //   \\_    |    |// ___  |__\\ \\"
puts     "  |    |   |__|\\____/|  | (_______/\\_____/   |    | | |__| |____/  "
puts     "  \\____/             |__|                    \\____//\\______|_______/"
p
p
p
###(((((((()))))))((((((()))))))(GameConsole)((((((()))))))((((((())))))))###
    until $game == "done" do
      $game.print_board
      move = $game.get_move
      $game.checkval(move)
      $game.print_board
      if $game.board.winr($game.board) == true
        p
        p "Player #{$game.current_player.marker} Wins This One"
        $game = "done"
        
      elsif $game.board.full? == true
        p
        p "KiTty DoNe Got THis One"  
        $game = "done"
       
      else
        $game.player_sel
      end  
       
    end
