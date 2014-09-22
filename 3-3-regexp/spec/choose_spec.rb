require_relative 'spec_helper'

describe Choose do
  context "when pattern is '/a|b/'" do
    before :all do
      @pattern = Choose.new(Literal.new('a'), Literal.new('b'))
    end

    describe "#inspect" do
      it "returns '/a|b/'" do
        expect(@pattern.inspect).to eq('/a|b/')
      end
    end

    describe "#matches?" do
      it "returns true for 'a'" do
        expect(@pattern.matches?('a')).to be true
      end

      it "returns true for 'b'" do
        expect(@pattern.matches?('b')).to be true
      end

      it "returns false for 'c'" do
        expect(@pattern.matches?('c')).to be false
      end
    end
  end
end
