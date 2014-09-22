require_relative 'spec_helper'

describe Concatenate do
  context "when pattern is '/abc/'" do
    before :all do
      @pattern = Concatenate.new(
        Literal.new('a'),
        Concatenate.new(Literal.new('b'), Literal.new('c')))
    end

    describe "#new" do
      it "returns the correct pattern" do
        expect(@pattern.inspect).to eq('/abc/')
      end
    end

    describe "#matches?" do
      it "shouldn't match 'a'" do
        expect(@pattern.matches?('a')).to be false
      end

      it "shouldn't match 'ab'" do
        expect(@pattern.matches?('ab')).to be false
      end

      it "should match 'abc'" do
        expect(@pattern.matches?('abc')).to be true
      end
    end
  end

  context "when pattern is '/ab/'" do
    before :all do
      @pattern = Concatenate.new(Literal.new('a'), Literal.new('b'))
    end

    describe "#new" do
      it "returns '/ab'" do
        expect(@pattern.inspect).to eq('/ab/')
      end
    end

    describe "#matches?" do
      it "shouldn't match 'a'" do
        expect(@pattern.matches?('a')).to be false
      end

      it "matches 'ab'" do
        expect(@pattern.matches?('ab')).to be true
      end

      it "shouldn't match 'abc'" do
        expect(@pattern.matches?('abc')).to be false
      end
    end
  end
end
