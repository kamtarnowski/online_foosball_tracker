class SampleRand

  def initialize(e)
    @E = e
    @sums = []
    @E.each_with_index { |x, i| @sums << (@sums.last || 0) + @E[i][:pct] }
  end

  def draw
    rand = Random.rand()

    for i in 0..(@sums.length-1)
      return @E[i][:el] if rand <= @sums[i]
    end
  end

end