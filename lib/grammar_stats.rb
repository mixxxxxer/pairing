class GrammarStats
  def initialize
    @total_text = 0
    @total_passed = 0
  end

  def check(text) 
  #  if !text.empty? 
  #    first_word = text.split(" ").first
  #    return first_word.capitalize() == first_word 
  #  else
  #    return false
  #  end
    @total_text += 1
    result = text.empty? ? false : (text[0].upcase == text[0]) && (".!?".include?(text[-1]))
    @total_passed += 1 if result
    return result
  end

  def percentage_good
    @total_text == 0 ? 0 : @total_passed.to_f / @total_text.to_f * 100
  end
end