require "probable_happiness/runner"

module ProbableHappiness

  def self.run(options)
    ProbableHappiness::Runner.new(options).call
  end

end
