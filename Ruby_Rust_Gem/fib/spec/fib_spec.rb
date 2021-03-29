# frozen_string_literal: true

RSpec.describe Fib do
  it "has a version number" do
    expect(Fib::VERSION).not_to be nil
  end

  it "calculates fibonacci" do
    expect(Fib[10]).to eq(55)
  end
end
