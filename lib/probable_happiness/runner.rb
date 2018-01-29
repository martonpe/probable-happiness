require 'date'
require "probable_happiness/calculator"
require "probable_happiness/tweeter"

module ProbableHappiness
  class Runner
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def call
      calculator = Calculator.new(ticker, start_date, end_date)
      calculator.call
      tweet =  "I wish I bought #{ticker} on #{start_date}! "
      tweet += "I would have made #{calculator.total_return} with a drawdown of #{calculator.max_drawdown} by #{end_date}. #SoSad"
      Tweeter.new.tweet(tweet)
    end

    def ticker
      options.fetch(:ticker)
    end

    def start_date
      Date.parse(options.fetch(:start_date))
    end

    def end_date
      Date.parse(options.fetch(:end_date))
    end
  end
end
