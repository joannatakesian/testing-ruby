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
        win
        draw
        return @grid
    end
    
    def draw
        unless @grid.flatten.include?(" ")
            puts "It's a draw!"
            @game_over = true
        end
    end
    
    def win
        #horizontal win
        @grid.each do |line|
            unless line.include?(" ")
                if line[0..3].uniq.size <= 1
                    puts "Game over!"
                    @game_over = true
                elsif line[1..4].uniq.size <= 1
                    puts "Game over!"
                    @game_over = true
                elsif line[2..5].uniq.size <= 1
                    puts "Game over!"
                    @game_over = true
                end
            end
        end
        
        #vertical win
        flat_grid = @grid.flatten
        vertical_lines = []
        vertical_lines << [flat_grid[0], flat_grid[6], flat_grid[12], flat_grid[18], flat_grid[24], flat_grid[30]]
        vertical_lines << [flat_grid[1], flat_grid[7], flat_grid[13], flat_grid[19], flat_grid[25], flat_grid[31]]
        vertical_lines << [flat_grid[2], flat_grid[8], flat_grid[14], flat_grid[20], flat_grid[26], flat_grid[32]]
        vertical_lines << [flat_grid[3], flat_grid[9], flat_grid[15], flat_grid[21], flat_grid[27], flat_grid[33]]
        vertical_lines << [flat_grid[4], flat_grid[10], flat_grid[16], flat_grid[22], flat_grid[28], flat_grid[34]]
        vertical_lines << [flat_grid[5], flat_grid[11], flat_grid[17], flat_grid[23], flat_grid[29], flat_grid[35]]
        
        vertical_lines.each do |line|
            unless line.include?(" ")
                if line[0..3].uniq.size <= 1
                    puts "Game over!"
                    @game_over = true
                elsif line[1..4].uniq.size <= 1
                    puts "Game over!"
                    @game_over = true
                elsif line[2..5].uniq.size <= 1
                    puts "Game over!"
                    @game_over = true
                end
            end
        end
        
        #diagonal win
        diag_grid = @grid.flatten
        diag_lines = [[diag_grid[12], diag_grid[19], diag_grid[26], diag_grid[33]], [diag_grid[2], diag_grid[9], diag_grid[16], diag_grid[23]], [diag_grid[3], diag_grid[8], diag_grid[13], diag_grid[18]], [diag_grid[17], diag_grid[22], diag_grid[27], diag_grid[33]], [diag_grid[6], diag_grid[13], diag_grid[20], diag_grid[27], diag_grid[34]], [diag_grid[1], diag_grid[8], diag_grid[15], diag_grid[22], diag_grid[29]], [diag_grid[4], diag_grid[9], diag_grid[14], diag_grid[19], diag_grid[24]], [diag_grid[11], diag_grid[16], diag_grid[21], diag_grid[26], diag_grid[31]], [diag_grid[0], diag_grid[7], diag_grid[14], diag_grid[21], diag_grid[28], diag_grid[31]], [diag_grid[5], diag_grid[10], diag_grid[15], diag_grid[20], diag_grid[25], diag_grid[30]]]
        
        diag_lines.each do |line|
            unless line.include?(" ")
                if line.size <= 4
                    if line.uniq.size <= 1
                        puts "Game over!"
                        @game_over = true
                    end
                elsif line.size == 5
                    if line[0..3].uniq.size <= 1
                        puts "Game over!"
                        @game_over = true
                    elsif line[1..4].uniq.size <= 1
                        puts "Game over!"
                        @game_over = true
                    end
                elsif line.size >= 6
                    if line[0..3].uniq.size <= 1
                        puts "Game over!"
                        @game_over = true
                    elsif line[1..4].uniq.size <= 1
                        puts "Game over!"
                        @game_over = true
                    elsif line[2..5].uniq.size <= 1
                        puts "Game over!"
                        @game_over = true
                    end
                end
            end
        end
        
        return @game_over
    end

end
