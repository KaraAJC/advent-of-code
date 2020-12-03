INPUT = File.open(ARGV[0]).read.chomp("\n").split("\n")


class PasswordChecker

  attr_reader :parse_passwords, :check_passwords

  def initialize(passwords)
    @passwords = passwords
    @parsed_passwords = parse_passwords
  end

  def parse_passwords
    parsed = @passwords.map do |item|
      item_split = item.match(/(^\d*)-(\d*) (\w): (\w*)/)
      {
        min: item_split[1].to_i,
        max: item_split[2].to_i,
        letter: item_split[3],
        password: item_split[4]
      }
    end
    parsed
  end

  def validate_password(log)
    puts "there are #{log[:password].count(log[:letter])} letter #{log[:letter]}'s"
    puts "rules are minimum #{log[:min]} and max #{log[:max]}"
    log[:password].count(log[:letter]).to_i.between?(log[:min],log[:max])
  end

  def check_passwords
    @parsed_passwords.map do |log|
      validate_password(log)
   end.count(true)
  end

end

check = PasswordChecker.new(INPUT)

puts check.parse_passwords
puts "======="
puts "#{check.check_passwords} are valid"
