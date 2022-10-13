class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @finish = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm) 
    (count_words.to_f/wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) 
    words = wpm * minutes
    result = @contents.split(" ").slice(@finish, words).join(" ")
    if (@finish + words) > @contents.split(" ").size
      @finish = 0
    else
      @finish += words
    end
    return result
  end
end