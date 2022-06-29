class BowlingScore
  def initialize(scoresheet)
    @scoresheet = scoresheet
    @spare = []
    @total = []
  end

  def frames
    arr = @scoresheet.select{|frame| frame.sum < 10}
    if arr
      points = arr.flatten.sum
      @total.push(points)
    end
  end

  def spare?
    arr = @scoresheet.find{|frame| frame.sum == 10}
    if arr
      @spare.push(arr) 
      points = 10 + @spare[0][0]
      @total.push(points)
    end
  end

  def final_score
    final_score = @total.sum
    "The final score for this game is #{final_score}. You scored 0 strikes and 0 spares."
  end 
end 