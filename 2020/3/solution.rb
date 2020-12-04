class SkiExplorer

  attr_reader :show_slope, :count_trees_at

  def initialize(slope)
    @slope = slope
  end

  def show_slope
    puts @slope
  end

  def count_trees_at(over=3, down=1)
    snapshot = []
    @move_count = over - 1
    @slope.map do |row|
      puts "here's the row: #{row}"
      puts "here's what's at slot #{@move_count}: #{row[@move_count]}"
      snapshot << row[@move_count]
      puts "now we have #{snapshot}"
      @move_count = @move_count % row.length == 0 ? over - 1 : @move_count + 3
      puts "moving on to #{@move_count}"
    end
    puts snapshot
  end

end
