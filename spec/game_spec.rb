require_relative '../lib/game.rb'

describe Game do
    before :each do
        @game = Game.new
    end
    
    context "when a new game is started" do
        it "creates two players" do
            expect(@game.instance_variable_get(:@player_one)).to eq('\u2655')
            expect(@game.instance_variable_get(:@player_two)).to eq('\u2658')
        end
        
        it "creates six empty rows" do
            expect(@game.instance_variable_get(:@grid)).to eq([[" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "]])
        end
    end
    
    context "if selected column is empty" do
        it "should add move to bottom row" do
            expect(@game.place_move(1, @game.instance_variable_get(:@player_one))).to eq([[" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], ['\u2655', " ", " ", " ", " ", " "]])
        end
    end
    
    context "if selected column has a placed move in row 6" do
        it "should stack the move in row 5" do
            @game.place_move(1, @game.instance_variable_get(:@player_one))
            expect(@game.place_move(1, @game.instance_variable_get(:@player_two))).to eq([[" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], ['\u2658', " ", " ", " ", " ", " "], ['\u2655', " ", " ", " ", " ", " "]])
        end
    end
    
    context "if selected column is full" do
        it "should return an error" do
            @game.place_move(1, @game.instance_variable_get(:@player_one))
            @game.place_move(1, @game.instance_variable_get(:@player_one))
            @game.place_move(1, @game.instance_variable_get(:@player_one))
            @game.place_move(1, @game.instance_variable_get(:@player_one))
            @game.place_move(1, @game.instance_variable_get(:@player_one))
            @game.place_move(1, @game.instance_variable_get(:@player_one))
            expect(@game.place_move(1, @game.instance_variable_get(:@player_one))).to eq false
        end
    end
end

=begin
Tests to add:
it "should end game when tied" do
it "should end game when won" do
=end