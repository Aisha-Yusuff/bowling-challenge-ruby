require "bowling_score"

describe BowlingScore do 
  context "Gutter game" do 
    it "it returns the total score = 0 when player scores no points in game" do 
      scoresheet = BowlingScore.new([[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0][0,0],[0,0],[0,0]])
      expect(scoresheet.final_score).to eq ("The final score for this game is 0. You scored 0 strikes and 0 spares.")
    end 
  end 

  context "player scores points in only one frame" do 
    it "it returns the total score, 0 for the number of spares and strikes" do 
      scoresheet = BowlingScore.new([[0,0],[3,2],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]])
      scoresheet.frames
      scoresheet.spare?
      expect(scoresheet.final_score).to eq ("The final score for this game is 5. You scored 0 strikes and 0 spares.")
    end
  end

  context "player scores a spare in only one frame" do 
    it "it returns the total score, 0 strikes and 1 spares scored" do 
      scoresheet = BowlingScore.new([[0,0],[3,7],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]])
      scoresheet.frames
      scoresheet.spare?
      expect(scoresheet.final_score).to eq ("The final score for this game is 13. You scored 0 strikes and 1 spares.")
    end
  end

  context "player scores one strike" do 
    it "it returns the total score, 1 strikes and 0 spares scored" do 
      scoresheet = BowlingScore.new([[0,0],[10,0],[2,5],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]])
      scoresheet.frames
      scoresheet.spare?
      scoresheet.strike?
      expect(scoresheet.final_score).to eq ("The final score for this game is 24. You scored 1 strikes and 0 spares.")
    end
  end

  context "player scores points in multiple frames but no strikes or spares" do 
    it "it returns the total score, 0 strikes and 0 spares scored" do 
      scoresheet = BowlingScore.new([[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]])
      scoresheet.frames
      scoresheet.spare?
      scoresheet.strike?
      expect(scoresheet.final_score).to eq ("The final score for this game is 20. You scored 0 strikes and 0 spares.")
    end
  end

  context "player scores points in multiple spare" do 
    it "it returns the total score and the number of strikes and spares scored" do 
      scoresheet = BowlingScore.new([[1,1],[7,3],[6,4],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]])
      scoresheet.frames
      scoresheet.spare?
      scoresheet.strike?
      expect(scoresheet.final_score).to eq ("The final score for this game is 49. You scored 0 strikes and 2 spares.")
    end
  end
end 
