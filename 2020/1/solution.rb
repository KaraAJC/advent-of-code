require_relative 'advent_account.rb'


puts "Starting up the Advent Account checker"
puts "submit expenses now"
expenses = gets.chomp.split(",").map(&:to_i)
puts "Thanks! now, what factor should we search the expenses with"
factor = gets.chomp.to_i
test = AdventAccount.new(expenses, factor)

test.perform
