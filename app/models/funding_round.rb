class FundingRound

    attr_accessor :startup, :venture_cap, :type, :investment

    @@all = []

    def initialize(startup, venture_cap, type, investment)
        @startup = startup
        @venture_cap = venture_cap
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end

  
end
