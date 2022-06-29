class BowlingScore
  def initialize(scoresheet)
    @scoresheet = scoresheet
    @spare = []
    @total = []
    @spare_count = 0
  end

  def frames
    arr = @scoresheet.select{|frame| frame.sum < 10}
    if arr
      points = arr.flatten.sum
      @total.push(points)
    end
  end

  def spare?
    arr = @scoresheet.find{|frame| frame.sum == 10 && frame[0] != 10}
    if arr
      @spare.push(arr) 
      points = 10 + @spare[0][0]
      @total.push(points)
      @spare_count = +1
      p @spare
    end
  end

  def final_score
    final_score = @total.sum
    spare_count = @spare_count
    "The final score for this game is #{final_score}. You scored 0 strikes and #{spare_count} spares."
  end 
end 