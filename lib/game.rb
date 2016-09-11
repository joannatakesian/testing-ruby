class Game
    def initialize
        @player_one = '\u2655'
        @player_two = '\u2658'
        @players = [@player_one, @player_two]
        @grid = [[" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "]]
        @game_over = false
    end
    
    def turn
        while @game_over == false
            @players.each {|player| get_move(player)}
        end
    end
    
    def get_move(player)
        printf "Please enter a column 1-6: "
        move = gets.chomp
        place_move(move, player)
    end

    def place_move(move, player)
        if @grid[5][move.to_i - 1] == " "
            @grid[5][move.to_i - 1] = player
        elsif @grid[4][move.to_i - 1] == " "
            @grid[4][move.to_i - 1] = player
        elsif @grid[3][move.to_i - 1] == " "
            @grid[3][move.to_i - 1] = player
        elsif @grid[2][move.to_i - 1] == " "
            @grid[2][move.to_i - 1] = player
        elsif @grid[1][move.to_i - 1] == " "
            @grid[1][move.to_i - 1] = player
        elsif @grid[0][move.to_i - 1] == " "
            @grid[0][move.to_i - 1] = player
        else
            puts "Sorry, that column is full."
            return false
            get_move(player)
        end
        draw
        return @grid
    end
    
    def draw
        unless @grid.flatten.include?(" ")
            puts "It's a draw!"
            @game_over = true
        end
    end

end
