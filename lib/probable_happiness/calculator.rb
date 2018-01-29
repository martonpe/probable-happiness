require 'json'

module ProbableHappiness
  class Calculator
    attr_reader :ticker, :start_date, :end_date

    def initialize(ticker, start_date, end_date)
      @ticker = ticker
      @start_date = start_date
      @end_date = end_date
    end

    def call
      #TODO: Call the WIKIP API for ticker, start_date, end_date
    end

    def total_return

    end

    def max_drawdown

    end

    private

  end
end
