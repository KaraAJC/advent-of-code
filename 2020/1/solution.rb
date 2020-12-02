class AdventAccount

  def initialize(expenses)
    @expenses = expenses
  end

  def perform
    filter_big_nums
    winning_number(do_si_do)
  end

  private

  def filter_big_nums
    @expenses.reject! { |expense| expense >= 2020  }
  end

  def find_your_partner
    @expenses.combination(2).to_a()
  end

  def winning_pairs(pair)
    pair.sum == 2020
  end

  def do_si_do
    find_your_partner.each do |pair|
      puts "Checking pair #{pair}"
      return pair if winning_pairs(pair)
    end
  end

  def winning_number(pair)
    puts "the winning number is #{pair[0]*pair[1]}"
  end

end

puts "starting account"
test = AdventAccount.new([1721,979,366,299,675,1456])
test.perform
