# Probable Happiness

A stock return calculator that tweets its response

## Getting started

### Installation

```
$ git clone https://github.com/martonpe/probable-happiness.git
$ bin/setup
```

### Required environment variables

* `QUANDL_API_KEY`: You own API key to the Quandl API

## Usage

```
Version 0.1.0 of Probable Happiness
Usage: probable_happiness [options] [file]
    -s, --start-date START_DATE      The first day of the window to calculate on. Format: YYYY-DD-MM.
    -t, --ticker TICKER              The name of the stock to calculate.
    -h, --help                       Prints help
```

Try For examle:
```
$ bin/probable_happiness -s 2018-01-11 -t AAPL
I wish I bought AAPL on 2018-01-11! I would have made -2.15% with a drawdown of 4.55%. #SoSad
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/probable-happiness.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
