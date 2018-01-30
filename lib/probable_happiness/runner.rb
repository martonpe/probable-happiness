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
      raise ArgumentError.new("start_date must be in the past") unless end_date > start_date

      calculator = Calculator.new(ticker, start_date, end_date)
      tweet =  "I wish I bought #{ticker} on #{start_date}! "
      tweet += "I would have made #{calculator.total_return}% with a drawdown of #{calculator.max_drawdown}%. #SoSad"
      Tweeter.new.tweet(tweet)
    end

    def ticker
      options.fetch(:ticker)
    end

    def start_date
      Date.parse(options.fetch(:start_date))
    end

    def end_date
      Date.today
    end
  end
end
