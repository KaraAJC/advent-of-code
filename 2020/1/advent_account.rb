class AdventAccount

  def initialize(expenses, factor=2)
    @expenses = expenses
    @factor = factor
  end

  def perform
    filter_big_nums
    winning_number(do_si_do)
  end

  private

  def filter_big_nums
    @expenses.reject! { |expense| expense >= 2020 }
  end

  def find_your_partner
    @expenses.combination(@factor).to_a()
  end

  def winning_set(group)
    group.sum == 2020
  end

  def do_si_do
    find_your_partner.each do |group|
      puts "Checking group #{group}"
      return group if winning_set(group)
    end
  end

  def winning_number(group)
    puts "the winning number is #{group.reduce(:*)}"
  end

end
