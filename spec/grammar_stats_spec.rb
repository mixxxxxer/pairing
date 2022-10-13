require 'grammar_stats'

RSpec.describe "GrammarStats tests:" do
  context "Basic init" do
    it "Test 0. Check instant" do
      result = GrammarStats.new
      expect(result.class).to eq GrammarStats
    end
  end

  context "Check_method must return T or F" do
    it "Test 1. Check with empty string" do
      example = GrammarStats.new
      result = example.check("")
      expect(result).to eq false
    end
    it "Test 2. Check with 1 word with capital later without mark" do
      example = GrammarStats.new
      result = example.check("Word")
      expect(result).to eq false
    end
    it "Test 3. Check with 1 word with capital later in 5 words text without mark" do
      example = GrammarStats.new
      result = example.check("word word Word word word")
      expect(result).to eq false
    end
    it "Test 4. Check with first word with capital later in 5 words text without mark" do
      example = GrammarStats.new
      result = example.check("Word word Word word word")
      expect(result).to eq false
    end
    it "Test 5. Check with first word with capital later in 5 words text with mark" do
      example = GrammarStats.new
      result = example.check("Word word Word word word!")
      expect(result).to eq true
    end
  end
  context "percentage_good must return % passed texts" do
    it "Test 1. 1 text passed" do
      example = GrammarStats.new
      example.check("Word word Word word word!")
      result = example.percentage_good
      expect(result).to eq 100
    end
    it "Test 2. 3 text passed" do
      example = GrammarStats.new
      example.check("Word word Word word word!")
      example.check("Word word Word word word!")
      example.check("Word word Word word word!")
      result = example.percentage_good
      expect(result).to eq 100
    end
    it "Test 3. 2 texts passed 2 not" do
      example = GrammarStats.new
      example.check("Word word Word word word!")
      example.check("word word Word word word!")
      example.check("Word word Word word word!")
      example.check("word word Word word word!")
      result = example.percentage_good
      expect(result).to eq 50
    end
    it "Test 4.  no text" do
      example = GrammarStats.new
      result = example.percentage_good
      expect(result).to eq 0
    end
  end
end