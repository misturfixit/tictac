require_relative "console.rb"

  game = Console.new(Playerseq.new("x"),Playerhuman.new("o"))
#  game = run
    until game == "done" do
      game.print_board
      move = game.get_move
      game.checkval(move)
      if game.board.winr(game.board.board,game.current_player.marker) == true
        p "Player #{game.current_player.marker} Wins"
        game = "done"
      elsif game.board.f_board == true
        p "Kitty Got THis One"  
        game = "done"
      else
        game.current_player.player_sel
      end  
        # game.print_board
        # move = game.get_move
        # game.checkval(move)
        # game.print_board
    end
