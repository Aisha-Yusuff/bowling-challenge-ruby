require "bowling_score"

describe BowlingScore do 
  context "Gutter game" do 
    it "it returns total score = 0 when player scores no points in game" do 
      scoresheet = BowlingScore.new([[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0][0,0],[0,0],[0,0]])
      expect(scoresheet.final_score).to eq ("The final score for this game is 0. You scored 0 strikes and 0 spares.")
    end 
  end
end 