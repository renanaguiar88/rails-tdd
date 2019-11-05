class Counter
  @count = 0
 
  def self.count
    @count
  end

  def self.inc
    @count += 1
  end
end