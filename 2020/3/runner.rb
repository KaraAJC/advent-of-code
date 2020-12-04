require_relative 'solution.rb'

INPUT = File.open(ARGV[0]).read.chomp("\n").split("\n")


ski = SkiExplorer.new(INPUT)
ski.show_slope
ski.count_trees_at
