require 'spec_helper'
require "probable_happiness/calculator"

RSpec.describe ProbableHappiness::Calculator do
  let(:ticker) { 'AAPL' }
  let(:start_date) { Date.new(2015-01-23) }
  let(:end_date) { Date.new(2018-01-26) }

  let(:calculator) { ProbableHappiness::Calculator.new(ticker, start_date, end_date) }

  describe '#total_return' do
    it 'handles positive changes' do
      calculator.values = [176.19, 179.1, 190.51]
      expect(calculator.total_return).to eq(8.13)
    end

    it 'handles negative changes' do
      calculator.values = [200.50, 179.1, 190.19]
      expect(calculator.total_return).to eq(-5.14)
    end
  end

  describe '#max_drawdown' do
    it 'handles single peaks' do
      calculator.values = [177.0, 177.04, 174.22, 171.11, 171.1]
      expect(calculator.max_drawdown).to eq(3.36) #(177.04-171.1)/177.04
    end

    it 'handles multiple peaks' do
      calculator.values = [176.19, 185.1, 179.26, 178.46, 177.0, 177.04, 180.22, 174.11, 174.51]
      expect(calculator.max_drawdown).to eq(5.94)  #(185.1-174.11)/185.1
    end

    it 'handles multiple peaks and chooses second' do
      calculator.values = [176.19, 179.1, 179.26, 178.46, 177.0, 175.04, 180.22, 174.11, 172.51]
      expect(calculator.max_drawdown).to eq(4.28)  #(180.22-172.51)/180.22
    end
  end
end

