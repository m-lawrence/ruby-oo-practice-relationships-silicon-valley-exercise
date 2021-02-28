

class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(name_arg, domain)
        @name = name_arg 
        @domain = domain
    end

    def self.find_by_founder(founder_arg)
        self.all.find {|starter| starter.founder == founder_arg}
    end

    def self.domains
        self.all.map do |starter|
            starter.domain
        end
    end

    def fund_r_helper
        FundingRound.all.select {|round| round.startup == self}
    end

    def sign_contract(vc, type_arg, investment_arg)
        FundingRound.new(self, vc, type_arg, investment_arg)
    end

    def num_funding_rounds
        fund_r_helper.count
    end

    def total_funds
        i_sum = []
        fund_r_helper.map do |rounds|
           i_sum << rounds.investment
        end
        i_sum.inject(0) {|sum, x| sum + x}
    end

    def investor_helper
        fund_r_helper.map do |round|
        round.venture_cap
        end
    end

    def investors
       my_investors = investor_helper.uniq
    end

    def big_investors
      investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end


end
