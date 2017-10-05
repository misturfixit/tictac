
require_relative 'board.rb'
require_relative 'player_class.rb'
require_relative 'splayer.rb'
require_relative 'rplayer.rb'
require_relative 'aiplayer.rb'
require_relative 'unplayer.rb'




def game

    board = Board.new
    player = Player.new
    game = "notyet"
    ai = "lola"
until game != "notyet" do
    p "How Many Players: 1 or 2"
    num = gets.chomp

    if num == "1"
        
        until ai != "lola" do
            p "how hard do you want it to be: 1:2:3"
            diff = gets.chomp
                
            if diff == "2"
                ai = Splayer.new
                game = "start"
            elsif diff == "1"
                ai = Rplayer.new
                game = "start"
            elsif diff == "3"
                ai = Trymeplayer.new
                game = "start"
            else
                p "not a valid choice"
            end    
        end
    elsif num == "2"
        game = "start"
    else
        p "Not a valid Entry"
    end
end
    
    if game == "start"
        until game == "end"
            choice = ""
            board.print
            p "player #{player.player}'s turn'"
            if player.player == "o"
                choice = gets.chomp
            elsif ai != "lola"
                choice = ai.move(board.gboard)  
            else
                choice = gets.chomp
            end
                    
            if board.pick_check?(choice) == true
                if board.validmove?(choice) == true
                    board.updateboard(player.player,choice)
                    if board.winner? == true
                        p "player #{player.player} is the winner"
                        game = "end"
                        board.print
                    else
                        if board.fullboard? == true
                            
                            board.print
                            p "TIE GAME"
                            game = "end"
                            
                        else
                            player.playerchange
                        end
                    end
                else
                    p "spot already taken"
                end
            else
            p "not a valid choice"
            end
        end
    end
end

game