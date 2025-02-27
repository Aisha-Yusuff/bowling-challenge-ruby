class BowlingScore
  def initialize(scoresheet)
    @scoresheet = scoresheet
    @spare = []
    @total = []
    @spare_count = 0
    @strike_count = 0
  end

  # calculate points for frames that are not strikes or spares
  # push points into @total arrat
  def frames
    arr = @scoresheet.select { |frame| frame.sum < 10 }
    return unless arr
    points = arr.flatten.sum
    @total.push(points)
  end

  def spare?
    arr = @scoresheet.select { |frame| frame.sum == 10 && frame[0] != 10 }
    return unless arr 
    arr.each do |rolls|
      @spare.push(rolls) 
      points = 10 + rolls[0] 
      @total.push(points)
      @spare_count += 1
    end
  end

  def strike?
    arr = @scoresheet.each_with_index.select { |frame, _index| frame[0] == 10 }.map &:last
    return unless arr
    arr.each do |rolls|
      next_roll = @scoresheet[rolls + 1]
      points = 10 + next_roll.sum 
      @total.push(points)
      @strike_count += 1
    end
  end

  
  def final_score
    final_score = @total.sum
    spare_count = @spare_count
    strike_count = @strike_count
    "The final score for this game is #{final_score}. You scored #{strike_count} strikes and #{spare_count} spares."
  end 
end 
