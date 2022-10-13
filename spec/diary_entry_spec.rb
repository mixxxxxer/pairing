require 'diary_entry'

RSpec.describe "diary entry method" do
  context 'test class instance' do
  it "test 1 creates a class instance title" do
    example = DiaryEntry.new("", "")
    expect(example.title).to eq ""
  end
  it "test 2 creates a class instance contents" do
    example = DiaryEntry.new("", "")
    expect(example.contents).to eq ""
  end
   it "test 3 returns num of words in contents as integer" do
    example = DiaryEntry.new("", "")
    expect(example.count_words).to eq 0
  end
  it "test 4 returns num of words in contents as integer" do
    example = DiaryEntry.new("",( "one " * 100))
    expect(example.count_words).to eq 100
  end
  it "test 5 returns the reading time as an integer" do
    example = DiaryEntry.new("",( "one " * 100))
    expect(example.reading_time(10)).to eq 10
  end
  it "test 6 returns the reading time as an integer" do
    example = DiaryEntry.new("",( "one " * 101))
    expect(example.reading_time(10)).to eq 11
  end
  it "test 7 returns a string of text that user can read within time" do
    example = DiaryEntry.new("", (1..100).to_a.join(" "))
    expect(example.reading_chunk(2, 3)).to eq "1 2 3 4 5 6"
  end
  it "test 8 returns the next chunk of text that user can read within time" do
    example = DiaryEntry.new("", (1..100).to_a.join(" "))
    example.reading_chunk(2, 3)
    expect(example.reading_chunk(2, 3)).to eq "7 8 9 10 11 12"
  end
  it "test 9 returns the next chunk of text that user can read within time" do
    example = DiaryEntry.new("", (1..10).to_a.join(" "))
    example.reading_chunk(2, 3)
    expect(example.reading_chunk(2, 3)).to eq "7 8 9 10"
  end
    it "test 10 returns to the beginning if user has already read all text" do
    example = DiaryEntry.new("", (1..10).to_a.join(" "))
    example.reading_chunk(2, 3)
    example.reading_chunk(2, 3)
    expect(example.reading_chunk(2, 3)).to eq "1 2 3 4 5 6"
  end
 end
end