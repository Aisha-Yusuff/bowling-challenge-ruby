class BowlingScore
  def initialize(scoresheet)
    @scoresheet = scoresheet
  end

  def final_score
    total_array = @scoresheet.flatten
    total = total_array.sum
    "The final score for this game is #{total}. You scored 0 strikes and 0 spares."
  end 
end 