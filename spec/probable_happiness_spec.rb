require 'spec_helper'

RSpec.describe ProbableHappiness do
  it "has a version number" do
    expect(ProbableHappiness::VERSION).not_to be nil
  end

  describe '#run' do
    it 'invokes Runner' do
      expect_any_instance_of(ProbableHappiness::Runner).to receive(:call)
      ProbableHappiness.run({})
    end
  end
end
