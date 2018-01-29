require 'spec_helper'
require "probable_happiness/runner"

RSpec.describe ProbableHappiness::Runner do
  let(:options) do
    {
      start_date: '2015-01-23',
      end_date: '2018-01-28',
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
      expect(runner.start_date).to eq Date.new(2015, 1, 23)
    end

    it 'throws an error if start_date is not present' do
      options.delete(:start_date)
      expect { runner.start_date }.to raise_error(KeyError)
    end
  end

  describe '#end_date' do
    it 'parses the date correctly' do
      expect(runner.end_date).to eq Date.new(2018, 1, 28)
    end

    it 'throws an error if end_date is not present' do
      options.delete(:end_date)
      expect { runner.end_date }.to raise_error(KeyError)
    end
  end

  describe '#call' do
    it 'invokes Calculator#call and Tweeter#tweet' do
      expect_any_instance_of(ProbableHappiness::Calculator).to receive(:call)
      expect_any_instance_of(ProbableHappiness::Tweeter).to receive(:tweet)
      runner.call
    end
  end
end
