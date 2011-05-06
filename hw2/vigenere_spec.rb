require 'rspec'
require 'vigenere'

describe "letter_frequencies tests" do
  [
    ["a", [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
    ["ab", [0.5, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
    ["abcz", [0.25, 0.25, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.25]],
    ["abcc", [0.25, 0.25, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
    ["bababaaaba", [0.6, 0.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
  ].each do |input, output|
    it "should return #{output} for #{input}" do
      input.letter_frequencies.should == output
    end
  end
end

describe "every nth letter tests" do
  [
    ["abcd", 2, 1, "ac"],
    ["abcd", 3, 1, "ad"],
    ["abcdefg", 4, 1, "ae"],
    ["abcdefg", 2, 2, "bdf"]
  ].each do |string, n, start, output|
    it "should return #{output} for string = #{string} and n = #{n}" do
      string.every_nth_letter(n, start).should == output
    end
  end
end

describe "dot_product tests" do
  [
    [[], [], 0],
    [[1], [2], 2],
    [[1, 3, 5], [4, 5, 6], 49],
    [[1, 3, -5], [4, -2, -1], 3]
  ].each do |vector_1, vector_2, dot_product|
    it "should return #{dot_product} for #{vector_1} x #{vector_2}" do
      vector_1.dot_product(vector_2).should == dot_product
    end
  end
end

describe "shift_array_by_one tests" do
  [
    [[1, 2], [2, 1]],
    [[1, 2, 3, 4, 5], [5, 1, 2, 3, 4]],
    [[5, 1, 2, 3, 4], [4, 5, 1, 2, 3]]
  ].each do |unshifted_array, shifted_array|
    it "should return #{shifted_array} for #{unshifted_array}" do
      unshifted_array.rotate!.should == shifted_array
    end
  end
end

describe "num_letters_in_same_pos" do
  [
    ["", "", 0],
    ["a", "a", 1],
    ["ab", "ac", 1],
    ["abcdefghij", "abdcefhgij", 6]
  ].each do |string_1, string_2, same_letters|
    it "should return #{same_letters} for #{string_1} and #{string_2}" do
      string_1.num_letters_in_same_pos(string_2).should == same_letters
    end
  end
end

describe "key_length_guess tests" do
  [
   ["aphuiplvwgiiltrsqrubriznyqrxwzlbkrhfvn", 6],
  ].each do |string, key_guess|
    it "should return #{key_guess} for #{string}" do
      key_length_guess(string).should == key_guess
    end
  end

end
