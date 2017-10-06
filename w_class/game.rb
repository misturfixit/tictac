require_relative "console.rb"

game = Console.new(@player1,@player2)
#  game = run
puts    "_______________       ___                 ______________"
puts    "\\__     __/|__|_\_____/  |_________________\\___      ___/ "
puts     "  |    |   |  |/  __/     __/__    //   __/  |    |  ____________"    
puts     "  |    |   |  \\  \\__    __/  __   //   \\_    |    |// ___   | | \\"
puts     "  |    |   |__|\\____/|  | (_______/\\_____/   |    | | |__| |____/  "
puts     "  \\____/             |__|                    \\____//\\______|_______/"



    game.plyrtype(@player1,@player2)
    until game == "done" do
      move = game.get_move
      game.checkval(move)
      game.print_board
      if game.board.winr(game.board.board,game.current_player.marker) == true
        p
        p "Player #{game.current_player.marker} Wins"
        game = "done"
        
      elsif game.board.f_board == true
        p
        p "KiTty DoNe Got THis One"  
        game = "done"
       
      else
        game.player_sel
      end  
         game.print_board
        # move = game.get_move
        # game.checkval(move)
        # game.print_board
    end
