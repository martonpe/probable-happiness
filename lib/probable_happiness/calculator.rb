require 'json'
require 'net/http'

module ProbableHappiness
  class Calculator
    WIKIP_API_URL = "https://www.quandl.com/api/v3/datatables/WIKI/PRICES"

    attr_reader :ticker, :start_date, :end_date
    attr_accessor :values

    def initialize(ticker, start_date, end_date)
      @ticker = ticker
      @start_date = start_date
      @end_date = end_date
    end

    def total_return
      @values = get_values if values.nil?

      initial_value = values[0]
      final_value = values[-1]
      total_return = ( final_value - initial_value ) / initial_value * 100

      total_return.round(2)
    end

    def max_drawdown
      @values = get_values if values.nil?

      peak = values.first
      low = values.first
      max_drawdown = 0
      values.each do |value|
        if value > peak then
          peak = value
          low = peak
        elsif value < low
          low = value
          tmp_drawdown = peak - low
          max_drawdown = tmp_drawdown if tmp_drawdown > max_drawdown
        end
      end
      drowdown = max_drawdown / peak * 100

      drowdown.round(2)
    end

    def get_values
      uri = URI(WIKIP_API_URL)
      api_key = ENV['QUANDL_API_KEY']
      dates = (start_date..end_date).map { |date| date.strftime('%Y-%m-%d') }
      params = { date: dates.join(','), ticker: ticker, api_key: api_key }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get(uri)

      JSON.parse(res)['datatable']['data'].map { |row| row[5] }
    end
  end
end
