require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

vent1 = VentureCapitalist.new("First VC", 99000000)
vent2 = VentureCapitalist.new("Second VC", 3000000000)
vent3 = VentureCapitalist.new("Third VC", 6000000000)

start1 = Startup.new("Lil project", "Bob Green", "His biz")
start2 = Startup.new("Fantastic idea", "Sandra Blue", "Her biz")

round1 = FundingRound.new(start1, vent2, "Angel", 10000.00)
round2 = FundingRound.new(start2, vent1, "Seed", 50000.00)
round3 = FundingRound.new(start1, vent1, "Seed", 6000.00)
round4 = FundingRound.new(start1, vent1, "Angel", 8000.00)
round5 = FundingRound.new(start2, vent2, "Seed", 1000000.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line