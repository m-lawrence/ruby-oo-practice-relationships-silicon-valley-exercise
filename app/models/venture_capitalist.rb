class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|cap| cap.total_worth >= 1000000000}
    end

    def offer_contract(startup_arg, type_arg, investment_arg)
        FundingRound.new(startup_arg, self, type_arg, investment_arg)
    end

    def funding_rounds 
        FundingRound.all.select {|round| round.venture_cap == self}
    end

    def startup_helper
        funding_rounds.map do |round|
            round.startup
        end
    end

    def portfolio
        startup_helper.uniq
    end

    def investment_helper
        funding_rounds.map do |round|
            round.investment 
        end
    end

    def biggest_investment
        investment_helper.max {|a, b| a <=> b}
    end

    def invested(domain_arg)
        my_moneys = funding_rounds.select {|round| round.startup.domain == domain_arg}
        my_moneys = my_moneys.map {|round| round.investment}
        my_moneys.inject(0) {|sum, x| sum + x}
    end

  
end
