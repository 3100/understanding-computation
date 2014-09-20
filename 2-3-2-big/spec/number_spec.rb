require 'spec_helper'

describe Number, "#evaluate" do
  it "returns a correct value" do
    Number.new(23).evaluate({}).should eq(Number.new(23))
  end
end
