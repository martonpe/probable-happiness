require 'spec_helper'
require "probable_happiness/runner"

RSpec.describe ProbableHappiness::Runner do
  let(:options) do
    {
      start_date: '2018-01-22',
      ticker: 'AAPL',
    }
  end
  let(:runner) { ProbableHappiness::Runner.new(options) }


  describe '#ticker' do
    it 'returns the ticker' do
      expect(runner.ticker).to eq 'AAPL'
    end

    it 'throws an error if ticker is not present' do
      options.delete(:ticker)
      expect { runner.ticker }.to raise_error(KeyError)
    end
  end

  describe '#start_date' do
    it 'parses the date correctly' do
      expect(runner.start_date).to eq Date.new(2018, 1, 22)
    end

    it 'throws an error if start_date is not present' do
      options.delete(:start_date)
      expect { runner.start_date }.to raise_error(KeyError)
    end
  end

  describe '#end_date' do
    it 'is set to today' do
      expect(runner.end_date).to eq Date.today
    end
  end

  describe '#call' do
    it 'raises error if start date is in the future' do
      options[:start_date] = Date.today.next_day.strftime('%Y-%m-%d')
      expect { runner.call }.to raise_error(ArgumentError)
    end

    it 'invokes Calculator and Tweeter#tweet' do
      expect_any_instance_of(ProbableHappiness::Calculator).to receive(:max_drawdown)
      expect_any_instance_of(ProbableHappiness::Calculator).to receive(:total_return)
      expect_any_instance_of(ProbableHappiness::Tweeter).to receive(:tweet)
      runner.call
    end
  end
end
